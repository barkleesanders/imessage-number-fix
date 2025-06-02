![bad](bad.png)

## iMessage (Messages) numbers-only fix

This is a simple sledgehammer approach to fix a bug in macOS Big Sur that causes Notifications from Messages.app to display only the phone number for incoming messages (not the name from your Address Book).

The script restarts (kickstarts) a handful of core services that, through trial and error, I determined to be associated with the local AddressBook database. This script was tested on macOS 11.4, on an Intel Mac Mini.

> ***N.B.*** Existing notifications are not updated, this only affects notifications that come in _after_ the script has been run.

## Setup

Before running the script, it's recommended to:

1.  Sign Out Of iMessage
2.  Close Messages.app

Then, to install and run the script, open your Terminal and use the following single-line command:

```bash
curl -LJO https://raw.githubusercontent.com/luckman212/imessage-number-fix/main/imessage_number_fix.sh && chmod +x imessage_number_fix.sh && ./imessage_number_fix.sh
```

Here's a breakdown of what this command does:

1.  **Downloads the script:**
    `curl -LJO https://raw.githubusercontent.com/luckman212/imessage-number-fix/main/imessage_number_fix.sh`
    This command uses `curl` to download the script file.
    *   `-L`: Follows redirects if the file has moved.
    *   `-J`: Uses the server-suggested filename (imessage_number_fix.sh).
    *   `-O`: Saves the file with that name.

2.  **Makes the script executable:**
    `chmod +x imessage_number_fix.sh`
    This command changes the permissions of the downloaded file (`imessage_number_fix.sh`) to allow it to be executed as a program. `+x` specifically adds the executable permission.

3.  **Runs the script:**
    `./imessage_number_fix.sh`
    This command executes the script you just downloaded and made executable.

The `&&` operator is used to chain these commands together. It ensures that the next command only runs if the previous one was successful.

## Updating the Script

To get the latest version of the script, you can re-run the download command:

```bash
curl -LJO https://raw.githubusercontent.com/luckman212/imessage-number-fix/main/imessage_number_fix.sh && chmod +x imessage_number_fix.sh
```

This will overwrite the old script file with the newest version. After updating, you can run it as usual.

## Usage

Whenever you encounter this bug, open a Terminal and run the script.

If you are in the same directory where you downloaded `imessage_number_fix.sh`, you can run it with:
```bash
./imessage_number_fix.sh
```
If the script is in a different directory, you'll need to provide the full path to it, or add it to your system's PATH.

## Related Discussion

- [Messages.app notification only shows contact number instead of contact names on macOS - Ask Different](https://apple.stackexchange.com/questions/407109/messages-app-notification-only-shows-contact-number-instead-of-contact-names-on)
