source ./script/deploy/select_option.sh
source ./script/deploy/update_version.sh
source ./script/deploy/run_fastlane.sh

# flavor : dev / prod
flavor=""

# platform : android / ios / both
platform=""

# method : firebase / store
method=""

# store param
upload_binary=true
upload_changelogs=true
upload_metadata=false
upload_screenshots=false
submit_for_review=true

# version
current_version=$(grep "version:" pubspec.yaml | awk '{print $2}')
release_number="0.0.0"
release_build_number=0
release_version="0.0.0+0"


# Select options
select_option

# Update version
update_version

# Flutter pub get
flutter clean && flutter pub get
if [[ "$platform" == "both" ]]; then
  run_fastlane "android"
  run_fastlane "ios"
else
  run_fastlane $platform
fi
