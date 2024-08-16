select_platform() {
  local android="android"
  local ios="ios"
  local both="both"
  local input_valid=1
  while [ $input_valid -ne 0 ]; do
    echo
    echo "Select platform:"
    echo "  a) $android"
    echo "  i) $ios"
    echo "  b) $both"
    read -n1 -ep "📱 Platform: " option
    case $option in
      "a"|"A") platform="$android";;
      "i"|"I") platform="$ios";;
      "b"|"B") platform="$both";;
      *) echo "Invalid option. Usage: [a/i/b]"
        continue;;
    esac
    input_valid=0
  done
}
