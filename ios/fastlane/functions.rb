# Load env
def load_env(flavor)
  Dotenv.load "../../lib/.env/#{flavor}/.env"
  puts "😋 flavor : #{ENV['FLAVOR']}"
  puts "📧 ios_testers : #{ENV['IOS_TESTERS']}"
  puts "📱 ios_firebase_app_id : #{ENV['IOS_FIREBASE_APP_ID']}"
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
    username: "#{ENV["FASTLANE_USER"]}",
    app_identifier: "#{ENV["FASTLANE_PACKAGE_NAME"]}",
    team_name: ENV["MATCH_TEAM_NAME"],
    team_id: ENV["MATCH_TEAM_ID"],
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

# match_type : development, appstore
def signing(match_type)
  sync_code_signing(
    type: match_type,
    git_url: ENV["MATCH_GIT_URL"],
    app_identifier: ENV["MATCH_APP_IDENTIFIER"],
    team_name: ENV["MATCH_TEAM_NAME"],
    team_id: ENV["MATCH_TEAM_ID"],
    git_basic_authorization: Base64.strict_encode64(ENV["MATCH_GIT_BASIC_AUTHORIZATION"]),
    app_identifier: ENV["MATCH_APP_IDENTIFIER"],
    readonly: true
  )
end

# Add devices UDID and update profile when changing the number of devices.
def add_devices()
  register_devices(
    devices_file: "../lib/.env/tester-udids.txt",
    team_id: ENV["MATCH_TEAM_ID"]
  )

  match(
    type: "development",
    force_for_new_devices: true,
    git_url: ENV["MATCH_GIT_URL"],
    app_identifier: ENV["MATCH_APP_IDENTIFIER"],
    git_basic_authorization: Base64.strict_encode64(ENV["MATCH_GIT_BASIC_AUTHORIZATION"]),
    team_id: ENV["MATCH_TEAM_ID"]
  )
end

# match_type : development, appstore
def nuke_match(match_type)
  nuke_type = match_type
  match_nuke(
    type: nuke_type,
    skip_confirmation: true,
    git_url: ENV["MATCH_GIT_URL"],
    git_basic_authorization: Base64.strict_encode64(ENV["MATCH_GIT_BASIC_AUTHORIZATION"]),
    app_identifier: ENV["MATCH_APP_IDENTIFIER"],
    team_id: ENV["MATCH_TEAM_ID"]
  )
end

# match_type : development, appstore
def refresh_match(match_type)
  match(
    type: match_type,
    git_url: ENV["MATCH_GIT_URL"],
    git_basic_authorization: Base64.strict_encode64(ENV["MATCH_GIT_BASIC_AUTHORIZATION"]),
    app_identifier: ENV["MATCH_APP_IDENTIFIER"],
    team_id: ENV["MATCH_TEAM_ID"],
  )
end
