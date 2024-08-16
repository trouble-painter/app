# Delete keystore
upload="upload"
source lib/.env/aos/$upload-key.properties
keystore=lib/.env/aos/$upload-keystore.jks
output=$(keytool -delete -keystore "$keystore" -alias "$keyAlias" -storepass "$storePassword" 2>&1)

if [ $? -eq 0 ]; then
  rm -rf $keystore
  echo "🟢 $upload signing delete"
else
  echo "🔴 $output"
  exit 1
fi
