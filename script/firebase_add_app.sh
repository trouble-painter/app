application_id="kr.co.devstory.troublepainter"

# Execute the flutterfire config command for dev and prod
for flavor in dev prod
do
  read -p "Enter the [$flavor] firebase project ID: " project_id
  ios_bundle_id=${application_id}.$flavor
  android_app_id=${application_id}.$flavor

  echo "😋 flavor : $flavor"
  echo "🤖 aos app id : $android_app_id"
  echo "🍎 ios bundle id : $ios_bundle_id"

  # Add application to firebase and create firebase_options.dart
  if ! flutterfire config \
    --project=${project_id} \
    --ios-bundle-id=${ios_bundle_id} \
    --android-app-id=${android_app_id}; then
    echo "🔴 Firebase configuration failed. Exiting..."
    exit 1
  fi

  # Move firebase_options.dart to lib/.env/flavor
  mv "lib/firebase_options.dart" "lib/.env/$flavor/firebase_options.dart"
done

echo "🟢 Firebase configuration is complete."
