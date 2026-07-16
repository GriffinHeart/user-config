# Excalidraw

Local Excalidraw instance, accessible at `http://excalidraw.localhost` via the
Caddy reverse proxy in `~/services/caddy/`.

## How it works

- Runs the official `excalidraw/excalidraw` image (nginx serving a pre-built SPA)
- Listens on port `3333` bound to all interfaces so Caddy can reach it through the Podman VM network
- Starts automatically at login via a LaunchAgent
- **Data is stored in browser localStorage** — drawings persist across container restarts but are tied to the browser. Clearing browser data will lose them.

## Managing

```sh
# Start
launchctl load ~/Library/LaunchAgents/com.local.excalidraw.plist

# Stop
launchctl unload ~/Library/LaunchAgents/com.local.excalidraw.plist

# Restart
podman compose -f ~/services/excalidraw/docker-compose.yml down
launchctl unload ~/Library/LaunchAgents/com.local.excalidraw.plist
launchctl load ~/Library/LaunchAgents/com.local.excalidraw.plist
```

## Gotchas

- Port must be bound to `0.0.0.0` (i.e. `"3333:80"`, not `"127.0.0.1:3333:80"`) — Caddy reaches the host via `host.containers.internal` which resolves to `192.168.127.254`, not loopback.
- The official image is a baked SPA — storage backend configuration is not possible at runtime without rebuilding the image. For persistent server-side storage a different image would be needed (`kiliandeca/excalidraw`).
