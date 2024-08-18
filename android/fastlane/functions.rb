# Load env
def load_env(flavor)
  Dotenv.load "../../lib/.env/#{flavor}/.env"
  puts "😋 flavor : #{ENV['FLAVOR']}"
  puts "📧 aos_testers : #{ENV['AOS_TESTERS']}"
  puts "📱 aos_firebase_app_id : #{ENV['AOS_FIREBASE_APP_ID']}"
end

# Build apk
def build_apk()
  flavor = ENV['FLAVOR']
  sh "flutter build apk --release --flavor #{flavor} -t lib/main_#{flavor}.dart"
end

# Build app bundle
def build_app_bundle()
  flavor = ENV['FLAVOR']
  sh "flutter build appbundle --release --flavor #{flavor} -t lib/main_#{flavor}.dart"
end

# Deploy to firebase app distribution
def deploy_to_firebase_app_distribution()
  firebase_app_distribution(
    app: ENV['AOS_FIREBASE_APP_ID'],
    testers: ENV['AOS_TESTERS'],
    firebase_cli_path: "/usr/local/bin/firebase",
    apk_path: "../build/app/outputs/flutter-apk/app-#{ENV['FLAVOR']}-release.apk"
  )
end

# Deploy to store
def deploy_to_store(
    submit_for_review,
    upload_binary,
    version_name,
    version_code,
    upload_changelogs,
    upload_metadata,
    upload_images,
    upload_screenshots
  )
  flavor = ENV['FLAVOR']
  upload_to_play_store(
    package_name: "#{ENV['FASTLANE_PACKAGE_NAME']}",
    json_key: "../lib/.env/#{flavor}/#{ENV['FASTLANE_PLAY_STORE_CREDENTIALS']}",
    release_status: submit_for_review ? 'completed' : 'draft',
    # rollout: upload_binary ? '0.1' : nil,
    version_name: version_name,
    version_code: version_code,
    aab: upload_binary ? "../build/app/outputs/bundle/#{flavor}Release/app-#{flavor}-release.aab" : nil,
    skip_upload_apk: true,
    skip_upload_aab: !upload_binary,
    skip_upload_changelogs: !upload_changelogs,
    skip_upload_metadata: !upload_metadata,
    skip_upload_images: !upload_images,
    skip_upload_screenshots: !upload_screenshots,
  )
end