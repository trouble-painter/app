run_fastlane() {
  local platform=$1
  
  # Run fastlane
  lane="[$platform | $flavor]"
  echo "🟠 $lane"
  cd "$platform" || exit

  if [[ "$platform" == "ios" ]]; then
    if ! pod install; then
      echo "🔴 $lane pod install failed."
      exit
    fi
  fi

  if ! fastlane $platform "$method" flavor:"$flavor" submit_for_review:$submit_for_review release_number:$release_number release_build_number:$release_build_number upload_metadata:$upload_metadata upload_screenshots:$upload_screenshots; then
    echo "🔴 $lane release failed."
    exit
  fi

  cd ../ || exit
  echo "🟢 $lane released."
}