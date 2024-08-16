select_version() {
  # Extract major, minor, patch, and build_number from the current version
  local major=$(echo $current_version | cut -d'.' -f1)
  local minor=$(echo $current_version | cut -d'.' -f2)
  local patch=$(echo $current_version | cut -d'.' -f3 | cut -d'+' -f1)
  local build_number=$(echo $current_version | cut -d'+' -f2)

  # Function to increase the build number
  increase_build_number() {
    build_number=$((build_number + 1))
  }

  local input_valid=1
  while [ $input_valid -ne 0 ]; do
    echo
    echo "Select version to increase:"
    echo "  m) Major version"
    echo "  n) Minor version"
    echo "  p) Patch version"
    echo "  b) Build number"
    echo "  s) Skip"
    read -n1 -ep "✨ Current version: $current_version (m/n/p/b/s): " option
    case $option in
      "m"|"M") major=$((major + 1)) && minor=0 && patch=0 && increase_build_number;;
      "n"|"N") minor=$((minor + 1)) && patch=0 && increase_build_number;;
      "p"|"P") patch=$((patch + 1)) && increase_build_number;;
      "b"|"B") increase_build_number;;
      "s"|"S") ;;
      *) echo "Invalid option. Usage: [m|n|p|b|s]"
        continue
      ;;
    esac
    input_valid=0
  done
  echo

  # Generate the new version string
  release_number="$major.$minor.$patch"
  release_build_number=$build_number
  release_version="$release_number+$release_build_number"
  
  if [ "$current_version" != "$release_version" ]; then
    if ! confirm "✅ $current_version -> $release_version"; then
      exit 0
    fi
  fi
}
