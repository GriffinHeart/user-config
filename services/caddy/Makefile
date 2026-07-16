COMPOSE = /opt/homebrew/bin/podman compose -f docker-compose.yml

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

reload:
	$(COMPOSE) exec caddy caddy reload --config /etc/caddy/Caddyfile

logs:
	$(COMPOSE) logs -f

pf:
	sudo pfctl -e -f pf-forward.conf
