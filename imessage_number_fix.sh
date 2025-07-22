#!/usr/bin/env bash

if [[ "$(uname)" != "Darwin" ]]; then
	echo "This script is only for macOS."
	exit 1
fi

if pgrep -x "Messages" >/dev/null; then
	echo "Messages.app is running. Please quit it before running this script."
	exit 1
fi

restart_services() {
	declare -a xpcArr=(
		gui/$UID/com.apple.AddressBook.abd
		gui/$UID/com.apple.AddressBook.AssistantService
		gui/$UID/com.apple.AddressBook.ContactsAccountsService
		gui/$UID/com.apple.AddressBook.SourceSync
		gui/$UID/com.apple.assistant_service
		gui/$UID/com.apple.assistantd
		gui/$UID/com.apple.CallHistorySyncHelper
		gui/$UID/com.apple.ContactsAgent
		gui/$UID/com.apple.iCloudNotificationAgent
		gui/$UID/com.apple.imagent
		gui/$UID/com.apple.imautomatichistorydeletionagent
		gui/$UID/com.apple.notificationcenterui.agent
		gui/$UID/com.apple.telephonyutilities.callservicesd
		gui/$UID/com.apple.usernoted
		gui/$UID/com.apple.UserNotificationCenterAgent
		user/$UID/com.apple.imdpersistence.IMDPersistenceAgent
	)

	for d in "${xpcArr[@]}"; do
		echo -n "restarting $d"
		read -r PID < <(launchctl kickstart -kp "$d" 2>/dev/null)
		if [ -n "$PID" ]; then
			echo " ✔ [$PID]"
		else
			echo " ✘"
		fi
	done
}

restart_services

echo "Done. Please restart Messages.app."
