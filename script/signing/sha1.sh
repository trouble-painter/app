# Show SHA-1
upload="upload"
source lib/.env/aos/$upload-key.properties
output=$(keytool -list -v -keystore "lib/.env/aos/$storeFile" -alias "$keyAlias" -storepass "$storePassword" 2>&1)

if [ $? -eq 0 ]; then
  echo "🟢 $upload"
  echo "$output" | grep -A 1 "SHA1"
else
  echo "🔴 $output"
  exit 1
fi
