select_flavor() {
  local flavor_dev="dev"
  local flavor_prod="prod"
  local input_valid=1
  while [ $input_valid -ne 0 ]; do
    echo
    echo "Select flavor:"
    echo "  d) $flavor_dev"
    echo "  p) $flavor_prod"
    read -n1 -ep "😋 Flavor: " option
    case $option in
      "d"|"D") flavor="$flavor_dev";;
      "p"|"P") flavor="$flavor_prod";;
      *) echo "Invalid option. Usage: [d/p]"
        continue;;
    esac
    input_valid=0
  done
}
