# MacBook Headless Dev Setup (M3)

SSH into your MacBook while the lid is closed and your partner is using it, with automatic sleep management.

MacBook must be on AC power for preventing sleep on lid

---

## 1. Enable SSH

In settings remote login

---

## 2. SSH Key Auth

Copy pub key to mac ~/.ssh/authorized_keys

---

## 3. Auto-caffeinate per SSH Session

Add to `~/.ssh/rc` fires on every SSH login, dies when the session ends:

```bash
caffeinate -i -w $PPID &
echo "$(date): caffeinate started for PID $PPID" >> /tmp/ssh-rc.log
```

---

## 4. Sleep Manager Daemon

Dynamically enables/disables sleep based on whether SSH sessions are active.

### `/usr/local/sbin/ssh-sleep-manager.sh`

```bash
#!/bin/bash
while true; do
    if pgrep -f "sshd-session:.*@" > /dev/null; then
        echo "$(date): SSH session active — preventing sleep"
        pmset -c sleep 0 disksleep 0
    else
        echo "$(date): No SSH sessions — restoring sleep"
        pmset -c sleep 10 disksleep 10
    fi
    sleep 30
done
```

### `/Library/LaunchDaemons/com.user.ssh-sleep-manager.plist`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.ssh-sleep-manager</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/sbin/ssh-sleep-manager.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/var/log/ssh-sleep-manager.log</string>
    <key>StandardErrorPath</key>
    <string>/var/log/ssh-sleep-manager.err</string>
</dict>
</plist>
```

### Install

```bash
sudo chmod +x /usr/local/sbin/ssh-sleep-manager.sh
sudo chown root:wheel /Library/LaunchDaemons/com.user.ssh-sleep-manager.plist
sudo launchctl load /Library/LaunchDaemons/com.user.ssh-sleep-manager.plist
```

---

### 5. setup hostname

Go to the sharing settings and set network name like something-something.local

use that in ssh

---

## Troubleshooting

```bash
# Check daemon status (PID + 0 = healthy)
sudo launchctl list | grep ssh-sleep-manager

# Watch sleep manager logs
tail -f /var/log/ssh-sleep-manager.log

# Check caffeinate fired on login
cat /tmp/ssh-rc.log

# Confirm caffeinate is running
pgrep -a caffeinate

# Restart daemon
sudo launchctl unload /Library/LaunchDaemons/com.user.ssh-sleep-manager.plist
sudo launchctl load /Library/LaunchDaemons/com.user.ssh-sleep-manager.plist
```
