update_version() {
  if [[ $current_version == "$release_version" ]]; then
    return
  fi

  # Update the version in pubspec.yaml
  sed -i '' "s/version: $current_version/version: $release_version/" pubspec.yaml
  echo "Updated version: $release_version"
}