# Show alias list
upload="upload"
source lib/.env/aos/$upload-key.properties
echo "🟡 Show alias list $upload signing."
keytool -list -keystore lib/.env/aos/$upload-keystore.jks -alias "$keyAlias" -storepass "$storePassword"
