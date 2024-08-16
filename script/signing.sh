select_signing_action() {
  local create="create"
  local delete="delete"
  local report="report"
  local list="list"
  local sha1="sha1"
  local input_valid=1
  while [ $input_valid -ne 0 ]; do
    echo
    echo "Select action:"
    echo "  c) $create"
    echo "  d) $delete"
    echo "  r) $report"
    echo "  l) $list"
    echo "  s) $sha1"
    read -n1 -ep "✍️ action: " option
    case $option in
      "c"|"C") sh "./script/signing/$create.sh";;
      "d"|"D") sh "./script/signing/$delete.sh";;
      "r"|"R") cd android && ./gradlew signingReport && cd ..;;
      "l"|"L") sh "./script/signing/$list.sh";;
      "s"|"S") sh "./script/signing/$sha1.sh";;
      *) echo "Invalid option. Usage: [c/d/l/s]"
        continue;;
    esac
    input_valid=0
  done
}

select_signing_action
