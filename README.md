![bad](bad.png)

## iMessage (Messages) numbers-only fix

This is a simple sledgehammer approach to fix a bug in macOS Big Sur that causes Notifications from Messages.app to display only the phone number for incoming messages (not the name from your Address Book).

The script restarts (kickstarts) a handful of core services that, through trial and error, I determined to be associated with the local AddressBook database. This script was tested on macOS 11.4, on an Intel Mac Mini.

> ***N.B.*** Existing notifications are not updated, this only affects notifications that come in _after_ the script has been run.

## Setup

Sign Out Of iMessage

Close iMessage

Open terminal and run following command 

curl -LJO https://raw.githubusercontent.com/luckman212/imessage-number-fix/main/imessage_number_fix.sh && chmod +x imessage_number_fix.sh && ./imessage_number_fix.sh

The command curl -LJO https://raw.githubusercontent.com/luckman212/imessage-number-fix/main/imessage_number_fix.sh uses the curl command to download the file located at the specified URL. The options used in this command are:

-L: Follows redirects, this is useful in case the URL redirects to another location.
-J: Auto-name the file based on the URL, this will automatically save the file with the same name as the file on the server.
-O: Save the file with the same name as the file on the server.
The && operator is used to chain commands together. It runs the command that follows it only if the command preceding it completes successfully.

The command chmod +x imessage_number_fix.sh changes the permissions of the file imessage_number_fix.sh to make it executable. The +x flag adds the execute permission for the owner of the file.

Finally, ./imessage_number_fix.sh runs the script file imessage_number_fix.sh that has been downloaded and made executable in the previous commands.

Together, this command downloads the script file, makes it executable, and then runs it

## Usage

Whenever you encounter this bug, run the script by typing `imessage_number_fix.sh` in a Terminal.

## Related Discussion

- [Messages.app notification only shows contact number instead of contact names on macOS - Ask Different](https://apple.stackexchange.com/questions/407109/messages-app-notification-only-shows-contact-number-instead-of-contact-names-on)
