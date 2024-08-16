select_match_type() {
  local development="development"
  local appstore="appstore"
  local input_valid=1
  while [ $input_valid -ne 0 ]; do
    echo
    echo "Select match_type:"
    echo "  d) $development"
    echo "  a) $appstore"
    read -n1 -ep "🧩 Match_type: " option
    case $option in
      "d"|"D") match_type="$development";;
      "a"|"A") match_type="$appstore";;
      *) echo "Invalid option. Usage: [d/a]"
        continue;;
    esac
    input_valid=0
  done
}
