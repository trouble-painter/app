source ./script/deploy/select_flavor.sh

flavor=""
select_flavor

cd ios && fastlane ios add_devices flavor:$flavor && cd ..