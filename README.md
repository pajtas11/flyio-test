# nginx image for Fly.io

Files added:
- `Dockerfile` — builds an nginx image that uses an env-substituted template to set the listening port.
- `entrypoint.sh` — substitutes `$PORT` into `nginx.conf.template` and starts nginx.
- `nginx.conf.template` — nginx config template with `${PORT}` placeholder.
- `static/index.html` — sample static page served by nginx.
- `fly.toml` — minimal Fly config (change `app` to your app name).

Quick test locally:

```bash
docker build -t my-nginx .
docker run -p 8080:8080 -e PORT=8080 my-nginx
# then open http://localhost:8080
```

Deploying to Fly (assuming `flyctl` and login):

1. Create an app or set `app` in `fly.toml`:

```bash
flyctl apps create <your-app-name>
# or edit fly.toml and set app = "your-app-name"
```

2. Deploy using your Dockerfile (Fly will build it):

```bash
flyctl deploy
```

Notes:
- Fly provides the `PORT` env var; nginx must listen on that port. The image uses `entrypoint.sh` + `envsubst` to inject `PORT` into the nginx config at runtime.
- Change `app` in `fly.toml` before deploying, or use `flyctl launch` to generate config interactively.
