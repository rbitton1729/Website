# Website

I decided I hate WordPress, so here is the source for a site that uses Zola. It has a custom Docker image based on Alpine Linux which serves using nginx and has the Zola binary (zola serve sucks). Don't worry, I took WordPress off my resume.

## Overview

This is a static site built with [Zola](https://www.getzola.org/), a fast static site generator written in Rust. The site is containerized using Docker with a multi-stage build that compiles the site and serves it through nginx.

## Tech Stack

- **Zola** - Static site generator
- **Alpine Linux** - Lightweight container base
- **nginx** - Web server
- **Docker** - Containerization
- **Terminus theme** - Zola theme

## Project Structure

```
.
├── src/
│   ├── config.toml      # Zola configuration
│   ├── content/         # Markdown content files
│   ├── static/          # Static assets
│   ├── templates/       # HTML templates
│   ├── sass/            # Stylesheets
│   └── themes/          # Zola themes
├── Dockerfile           # Multi-stage Docker build
├── docker-compose.yml   # Container orchestration
├── nginx.conf           # nginx server configuration
└── serve.sh             # Build and deployment script
```

## Setup

### Prerequisites

- Docker
- Docker Compose
- Git

### Quick Start

Run the build and deployment script:

```bash
./serve.sh
```

Or manually:

```bash
docker compose build
docker compose up -d
```

The site will be available at `http://localhost:1313`

## Docker Architecture

The Dockerfile uses a multi-stage build:

1. **Builder Stage**: Uses Alpine Linux with Zola to build the static site
2. **Production Stage**: Uses nginx:alpine to serve the compiled site

This approach keeps the final image lightweight by excluding build dependencies.

## Configuration

### Port Mapping

The container exposes port 80 internally, mapped to port 1313 on the host (see `docker-compose.yml:8`).

### Network

The container connects to an external Docker network called `cloudflared-net` for integration with Cloudflare tunnels. 
If you will not be using Cloudflare Tunnels via Docker please delete the references to it in `docker-compose.yml` before running `./serve.sh` or you will get an error. 

Alternatively, create dummy network by running:

```bash
docker network create --driver=bridge cloudflared-net
```

### Site Configuration

Edit `src/config.toml` to customize:
- Base URL
- Site title and author
- Menu items
- Theme settings

## Development

To make changes:

1. Edit content in `src/content/`
2. Modify templates in `src/templates/`
3. Update styles in `src/sass/`
4. Rebuild and redeploy: `./serve.sh`

## Why Not `zola serve`?

The built-in `zola serve` command is great for development but not ideal for production. This setup uses nginx for:
- Better performance
- Production-grade serving
- Easier integration with reverse proxies
- In my experience `zola serve` can just be overall unreliable.

## License

See `LICENCE` file for details.
