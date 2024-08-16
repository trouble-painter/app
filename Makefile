# Init project
init:
	flutter pub get && make env && make flavor

# Clone env
env:
	git clone https://github.com/trouble-painter/app-env.git lib/.env;\
	ln -sf lib/.env/firebase.json firebase.json;\
	ln -sf lib/.env/flavorizr.yaml flavorizr.yaml;\
	ln -sf lib/.env/dev/flutter_launcher_icons.yaml flutter_launcher_icons-dev.yaml;\
	ln -sf lib/.env/prod/flutter_launcher_icons.yaml flutter_launcher_icons-prod.yaml

# Pull env
env-pull:
	cd lib/.env && git pull origin main && cd ../../

# Configuring the flavor environment (idempotent)
# Update app logo
flavor:
	flutter pub run flutter_flavorizr && flutter pub run flutter_launcher_icons

# Firebase add application
firebase-add-app:
	sh ./script/firebase_add_app.sh

# AOS signing
signing:
	sh ./script/signing.sh

# Fastlane-based deployment
deploy:
	sh ./script/deploy.sh

ios-add-devices:
	sh ./script/add_devices.sh

refresh-match:
	sh ./script/refresh_match.sh

# Build runner watch
watch:
	flutter pub run build_runner watch --delete-conflicting-outputs

update-metadata-screenshots:
	rsync -a ~/Desktop/Android/ ./android/fastlane/metadata/android/ && rsync -a ~/Desktop/iOS/ ./ios/fastlane/screenshots