# Load env
def load_env(flavor)
  Dotenv.load "../../lib/.env/#{flavor}/.env", "../../lib/.env/#{flavor}/fastlane.env"
  puts "😋 flavor : #{ENV['FLAVOR']}"
  puts "📧 ios_testers : #{ENV['IOS_TESTERS']}"
  puts "📱 ios_firebase_app_id : #{ENV['IOS_FIREBASE_APP_ID']}"

  # Shared by match, register_devices and upload_to_app_store through the lane context.
  key_id = ENV['ASC_KEY_ID']
  app_store_connect_api_key(
    key_id: key_id,
    issuer_id: ENV['ASC_ISSUER_ID'],
    key_filepath: File.expand_path("../../lib/.env/ios/AuthKey_#{key_id}.p8")
  )
end

# Build ipa
# - export_method : development, app-store
def build_ipa(export_method)
  flavor = ENV['FLAVOR']
  build_app(
    scheme: flavor,
    export_method: export_method,
    archive_path: "./build/#{flavor}/Runner.xcarchive",
    output_directory: "./build/Runner/#{flavor}"
  )
end

# Upload to crashlytics
def upload_to_crashlytics()
  flavor = ENV['FLAVOR']
  upload_symbols_to_crashlytics(
    dsym_path: "./build/Runner/#{flavor}/Runner.app.dSYM.zip",
    gsp_path: "./Runner/#{flavor}/GoogleService-Info.plist"
  )
end

# Upload to app store
def upload_to_appstore(
    version,
    upload_metadata,
    upload_changelogs,
    upload_screenshots,
    upload_binary,
    submit_for_review
  )
  upload_to_app_store(
    app_version: version,
    app_identifier: "#{ENV["FASTLANE_PACKAGE_NAME"]}",
    skip_metadata: !(upload_metadata || upload_changelogs),
    skip_screenshots: !upload_screenshots,
    skip_binary_upload: !upload_binary,
    overwrite_screenshots: upload_screenshots,
    force: true,
    phased_release: true, # Gradual deployment
    submit_for_review: submit_for_review, # Request review immediately after uploading the ipa (If false, only upload the ipa )
    automatic_release: false, # Whether to distribute the app immediately when app is approved(If false, wait for developer approval at App store connect)
    submission_information: {
      add_id_info_uses_idfa: false, # Whether to use IDFA
      add_id_info_serves_ads: false, # Advertising availability
      add_id_info_tracks_install: true, # Installation Tracking
      add_id_info_tracks_action: true, # Track specific behavior
    }
  )
  end

# Deploy to firebase app distribution
def deploy_to_firebase_app_distribution()
  firebase_app_distribution(
    app: ENV['IOS_FIREBASE_APP_ID'],
    testers: ENV['IOS_TESTERS'],
    firebase_cli_path: "/usr/local/bin/firebase",
    ipa_path: "./build/Runner/#{ENV['FLAVOR']}/Runner.ipa"
  )
end

# Ensure the dedicated match keychain exists, is unlocked, and is the only user keychain
def ensure_match_keychain
  keychain_name = ENV["MATCH_KEYCHAIN_NAME"]
  keychain_password = ENV["MATCH_KEYCHAIN_PASSWORD"]
  keychain_path = File.expand_path("~/Library/Keychains/#{keychain_name}-db")

  unless File.exist?(keychain_path)
    create_keychain(
      name: keychain_name,
      password: keychain_password,
      default_keychain: false,
      unlock: true,
      timeout: 3600,
      add_to_search_list: true
    )
  end

  unlock_keychain(
    path: keychain_name,
    password: keychain_password,
    add_to_search_list: true
  )

  # Search list = login + this project's keychain (same as ifeel). Sibling DevStory
  # projects' locked match keychains are left out so codesign never prompts for
  # them; they re-assert their own list on run. login.keychain must stay: git
  # reads the GitHub credential (gh) from it to clone the match repo.
  login_keychain = File.expand_path("~/Library/Keychains/login.keychain-db")
  sh("security", "list-keychains", "-d", "user", "-s", login_keychain, keychain_path)

  keychain_name
end

# match_type : development, appstore
# readonly: false only creates or renews this app's profiles. The certificates in
# the shared match repo belong to every DevStory app, so never nuke them here.
def signing(match_type, readonly: true, force: false, force_for_new_devices: false)
  keychain_name = ensure_match_keychain

  match(
    type: match_type,
    git_url: ENV["MATCH_URL"],
    app_identifier: ENV["MATCH_APP_IDENTIFIER"],
    team_id: ENV["MATCH_TEAM_ID"],
    readonly: readonly,
    force: force,
    force_for_new_devices: force_for_new_devices,
    keychain_name: keychain_name,
    keychain_password: ENV["MATCH_KEYCHAIN_PASSWORD"]
  )
end

# Add devices UDID and update profile when changing the number of devices.
def add_devices()
  register_devices(
    devices_file: "../lib/.env/tester-udids.txt",
    team_id: ENV["MATCH_TEAM_ID"]
  )

  signing("development", readonly: false, force_for_new_devices: true)
end

# match_type : development, appstore
# force: true regenerates the profiles so they point at the current certificates.
def refresh_match(match_type)
  signing(match_type, readonly: false, force: true)
end
