# Local Caddy Reverse Proxy

A personal Caddy reverse proxy for routing `*.localhost` hostnames to local services.
Caddy runs in Podman, starts automatically at login via a LaunchAgent, and is
accessible at port 80 via a `pf` port-forward rule.

## How it works

- `*.localhost` resolves to `127.0.0.1` natively in macOS — no `/etc/hosts` edits needed
- Caddy listens on `127.0.0.1:8080` (non-root processes can't bind to port 80)
- A `pf` rule forwards `localhost:80 → localhost:8080`
- Caddy routes by hostname to the target service via `host.containers.internal:<port>`
- `host.containers.internal` is automatically added to every Podman container's `/etc/hosts` — no `extra_hosts` config needed (unlike Docker)
- Each service port must be bound to `0.0.0.0` (not `127.0.0.1`) so Caddy can reach it through the Podman VM network (`192.168.127.254`)
- Each site block in the Caddyfile must include `:80` explicitly — without it Caddy defaults to port 443

## Directory structure

```
~/services/caddy/
  Caddyfile                    # routing rules — edit this to add new services
  docker-compose.yml           # Caddy container definition
  Makefile                     # shortcuts
  pf-forward.conf              # pf rule: tcp 80 -> 8080 on lo0
  com.local.pf-forward.plist   # LaunchDaemon source (copy to /Library/LaunchDaemons/)
~/Library/LaunchAgents/
  com.local.caddy.plist        # starts Caddy at login
/Library/LaunchDaemons/
  com.local.pf-forward.plist   # loads pf rule at boot (requires sudo)
```

## Initial setup

### 1. Load the pf port-forward (once, persists across reboots)

```sh
sudo cp ~/services/caddy/com.local.pf-forward.plist /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/com.local.pf-forward.plist
```

Or manually activate without rebooting:

```sh
make pf
```

### 2. Load the Caddy LaunchAgent

```sh
launchctl load ~/Library/LaunchAgents/com.local.caddy.plist
```

## Adding a new service

1. Expose the service port bound to all interfaces — **not** `127.0.0.1`:
   ```yaml
   ports:
     - "4000:4000"   # good - reachable via host.containers.internal
   # NOT "127.0.0.1:4000:4000" - Caddy can't reach loopback-only ports
   ```

2. Add a block to `Caddyfile` — include `:80` explicitly:
   ```
   myapp.localhost:80 {
     reverse_proxy host.containers.internal:4000
   }
   ```

3. Restart Caddy (reload works for clean configs, but restart is safer after any syntax issues):
   ```sh
   make down && make up
   ```

## Gotchas

- **`make reload` vs `make down && make up`** — `reload` works once Caddy is running with a valid config. If Caddy started with a bad Caddyfile (syntax error), it won't accept a reload; do a full restart instead.
- **No `extra_hosts` needed in Podman** — `host.containers.internal` is injected automatically. The `extra_hosts: host-gateway` syntax is Docker-specific and breaks on Podman.
- **Avoid em dashes in Caddyfile comments** — non-ASCII characters (`—`) cause Caddy to reject the config with a cryptic syntax error. Use plain hyphens (`-`).

## Current services

| Hostname                 | Port | Source                    |
|--------------------------|------|---------------------------|
| excalidraw.localhost     | 3333 | ~/services/excalidraw/    |

## Makefile targets

| Target        | Description                               |
|---------------|-------------------------------------------|
| `make up`     | Start Caddy                               |
| `make down`   | Stop Caddy                                |
| `make reload` | Reload Caddyfile without downtime         |
| `make logs`   | Follow Caddy logs                         |
| `make pf`     | Activate pf port-forward rule (needs sudo)|
