# Recover

Copy the contents of `backup` to `data`.

```sh
cp -r backup data
```

## Podman

Adaptations to `compose.yml` for recovery using Podman:

```yml
services:
  vaultwarden:
    # user: 1000:1000
    userns_mode: keep-id:uid=1000
    environment:
      DOMAIN: "http://localhost:8080"
      ROCKET_PORT: 8080
    ports:
      - 127.0.0.1:8080:8080
```

## Two Factor

Set up and use a TOTP code for recovery, since

- Passkeys are bound to the domain and only work with HTTPS, and
- recovery codes do not work as of 2025/12.
