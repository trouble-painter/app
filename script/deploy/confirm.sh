confirm() {
  message=${1:-"✅ Proceed?"}
  read -n1 -ep "${message} (y/N): " confirm
  confirm=${confirm:-N}

  if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    return 1
  fi
  return 0
}