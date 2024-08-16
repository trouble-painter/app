source ./script/deploy/confirm.sh
source ./script/deploy/select_flavor.sh
source ./script/deploy/select_platform.sh
source ./script/deploy/select_version.sh
source ./script/deploy/select_method.sh
source ./script/deploy/select_param.sh

select_option() {
  flutter_version=`fvm flutter --version | sed -n -e 's/.*Flutter \([0-9.]*\) .*/\1/p'`

  select_flavor
  select_method $flavor
  select_platform
  select_version

  if [[ "$method" == "store" ]]; then
    select_param "upload_binary" "💾" "Y" "n" "Upload Binary?"
    select_param "upload_changelogs" "📝" "Y" "n" "Upload Changelogs?"
    select_param "upload_metadata" "💽" "y" "N" "Upload Metadata?"
    select_param "upload_screenshots" "🖼️ " "y" "N" "Upload Screenshots?"
    select_param "submit_for_review" "✅" "Y" "n" "Submit for review?"
  fi

  echo "==============================================="
  printf "%-30s : %-30s\n" "flutter_version" "$flutter_version"
  printf "%-30s : %-30s\n" "flavor" "$flavor"
  printf "%-30s : %-30s\n" "method" "$method"
  printf "%-30s : %-30s\n" "platform" "$platform"
  printf "%-30s : %-30s\n" "version" "$current_version -> $release_version"
  if [[ "$method" == "store" ]]; then
    printf "%-30s : %-30s\n" "upload_binary" "$upload_binary"
    printf "%-30s : %-30s\n" "upload_changelogs" "$upload_changelogs"
    printf "%-30s : %-30s\n" "upload_metadata" "$upload_metadata"
    printf "%-30s : %-30s\n" "upload_screenshots" "$upload_screenshots"
    printf "%-30s : %-30s\n" "submit_for_review" "$submit_for_review"
  fi
  echo "==============================================="
  if ! confirm "🚀 Proceed with deploy?"; then
    exit 0
  fi
}