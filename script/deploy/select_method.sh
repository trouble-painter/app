select_method() {
  local flavor=$1
  local firebase="firebase"
  local store="store"
  if [[ "$flavor" == "dev" ]]; then
    method="$firebase"
  else
    local input_valid=1
    while [ $input_valid -ne 0 ]; do
      echo
      echo "Select method:"
      echo "  f) $firebase"
      echo "  s) $store"
      read -n1 -ep "🔮 Method: " option
      case $option in
        "f"|"F") method="$firebase";;
        "s"|"S") method="$store";;
        *) echo "Invalid option. Usage: [f/s]"
          continue;;
      esac
      input_valid=0
    done
  fi
}
