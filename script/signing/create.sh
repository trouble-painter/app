# Create keystore
upload="upload"
source lib/.env/aos/$upload-key.properties
echo "🟡 Create $upload signing."
keytool -genkey -v -keystore lib/.env/aos/$upload-keystore.jks -keyalg RSA \
      -keysize 2048 -validity 10000 -alias $upload-keystore -storepass "$storePassword"
