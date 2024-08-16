select_param() {
  local variable_name=$1
  local icon=$2
  local y=$3
  local n=$4
  local question=$5
  local input_valid=1
  while [ $input_valid -ne 0 ]; do
    echo
    echo "$icon $question"
    echo "  $y) yes"
    echo "  $n) no"
    echo
    read -n 1 -p "$variable_name ($y/$n): " option
    echo
    case $option in
      "y"|"Y")
        eval "$variable_name=true"
        ;;
      "n"|"N")
        eval "$variable_name=false"
        ;;
    esac
    input_valid=0
  done
}
