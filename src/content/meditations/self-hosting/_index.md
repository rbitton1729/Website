+++
title = 'How to Host a Website using Docker and Cloudflared'
draft = false
sort_by = "weight"

[extra]
date = 2025-10-16
+++

# How to Host a Website using Docker and Cloudflared

In today's world you may find yourself wanting to host a website for various purposes, whether it be a personal portfolio, business, or just a side project. I'm going to show you how to host three different kinds of websites using Docker: a WordPress site, a static Hugo site, and a Python Django site in a series of articles.

This series will teach you how to self-host websites from your own hardware using Docker for containerization and Cloudflare Tunnel (Cloudflared) to securely expose your sites to the internet without opening ports or needing a static IP address. Best of all, this setup is completely free for personal use.

## What You'll Learn in This Series

**Part 1 (This Article): Environment Setup**
- Installing Docker and Docker Compose
- Setting up Cloudflare Tunnel (Cloudflared)
- Understanding basic Docker networking
- Configuring your domain with Cloudflare

**Part 2: WordPress Site (Beginner)**
- Deploying WordPress with Docker
- Setting up MySQL database
- Configuring persistent storage

**Part 3: Static Hugo/Zola Site (Intermediate)**
- Building and serving a Hugo site
- Optimizing static content delivery

**Part 4: Python Django Site (Advanced)**
- Containerizing a Django application
- Setting up PostgreSQL
- Managing migrations and static files

**Part 5: Using a Spare Android Phone (Advanced)**
- Setting up Termux to host a static Hugo site
- Using Cloudflared to host that site on the public internet
- Setting up SSH so you can do all this without having to type on a tiny screen
