+++
title = "Server Help"
sort_by    = "date"
sort_order = "desc"
+++

# Server Help

This page contains instructions on how to access my servers in **Chicago, IL** and **Irvine, CA**, available to **University of Chicago** and **UC Irvine** students and faculty.

**Keep in mind this is a demo server.** Please be resource aware as there are only 4 threads and 16 GB of RAM. Use tools like `nice` and `systemd-run` whenever possible. I offer alternatives to common workflows using my other servers in the FAQ. In the future I plan to expand, assuming all goes well.

---

## Cloudflare Web Terminal

The current access method uses Cloudflare’s secure, browser-based SSH terminal.  
You do not need a VPN, SSH client, or key management.

I am considering more options, though they will all require a VPN to securly access the server.

---

## Step 1: Contact Me

If you’d like access, email **[sysadmin@rbitton.com](mailto:sysadmin@rbitton.com)** using your **institutional email address**.

Include the following in your message:

- Your **CNet ID** (UChicago) or **UCInetID** (UCI)
- A short explanation of what you’d like to use the server for

I’ll reply with your login details or ask for more information if needed.

---

## Step 2: Access the Web Terminal

1. Visit **[ssh.rbitton.com](https://ssh.rbitton.com)**.  
2. Log in using your email address through the Cloudflare Access portal. 
   - You’ll receive a one-time authentication code by email.  
   - This authentication should last for one week, though Cloudflare may require you to reauthentic sooner based on various factors.
3. Once authenticated, you’ll be prompted for your **username** (your CNet ID or UCInetID).
4. Use the **temporary password** sent to you in your confirmation email.
5. Your account is restricted to 15 GiB in your home folder. If you reach this limit you will hit an I/O failure. If you need more, contact me.

When you first log in, you’ll immediately be prompted to change your password.  
Your new password must meet the following requirements:  
**Minimum 8 characters, including at least three of: uppercase, lowercase, number, or special character.**

---

## FAQ

### I want to use Python

The servers run **Arch Linux (btw)**, which means the system Python is always up to date — often *too* up to date.  
We use **pyenv** to manage local Python versions.

Follow the setup instructions (skip installation section A) at:  
[github.com/pyenv/pyenv](https://github.com/pyenv/pyenv)

---

### Virtual Environments

Using `python -m venv` isn’t necessary with pyenv.  
Refer to the pyenv guide above, and also see the **pyenv-virtualenv** plugin for automatic environment switching:  
[github.com/pyenv/pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

---

### I want to use Docker

Each user account runs **rootless Docker**.  
To enable and start it, run:

```shell
systemctl --user enable --now docker
export DOCKER_HOST=unix:///run/user/$UID/docker.sock
```

for each login session. Then use docker as normal (no sudo).

If you'll be using Docker often, add this to you shell's rc file:

```shell
# For Bash:
echo 'export DOCKER_HOST=unix:///run/user/$UID/docker.sock' >> ~/.bashrc

# For Zsh:
echo 'export DOCKER_HOST=unix:///run/user/$UID/docker.sock' >> ~/.zshrc
```

---

### I want to compile something

This system is not ideal for large compilations. As your friendly sysadmin, please email a git repo and I will compile them for you on my workstation (i9-13900KF (32 threads) with 64 GB of RAM).

---

### I want to run an LLM or embedding model.

This will not work on this system. I have another server that can handle this (RTX 2070 with 8 GB of dedicated VRAM) and would be more than happy to tie it into whatever you are working on.

I also provide claude-code and gemini-cli binaries. Just run `claude` or `gemini` respectively and login.

---

### I want to expose something to the public internet or test my web apps

Due to security concerns, publicly open ports are never allowed on any of my systems (the UChicago sysadmins only realized the danger over summer 2025). You can use Cloudflare Tunnels (cloudflared) to expose services to the public internet. I use these for all my services and they are free with a Cloudflare account. You can find more about them [here](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/). While the cloudflared system binary is installed, I highly recommend using Docker.

You can also use this without an account for dev testing. Simply run `cloudflared tunnel --url http://localhost:{your-port}` and copy the generated URL into your browser. Or do the same using Docker. **Do not use this for production or leave it constantly running or Cloudflare will get mad**. See the docs above for using it in a production environment.

---

### There is a program or binary I would like to use that is not currently provided

Please let me know at the email at the bottom of this page. I will look into it and let you know. Most likely if it seems to benifit multiple users I will install it.

---

### I deleted something important, is there anything I can do?

Yes. All home folders are snapshoted every hour on the hour and are recoverable for a certain period of time. Contact me at **[sysadmin@rbitton.com](mailto:sysadmin@rbitton.com)** using your **institutional email address** and I can help you recover your file(s). 

**Please note that this should not replace version control (i.e. git), as snapshots are only kept for a certain time after creation and at certain intervals thereafter.**

---

### Are my files safe?
Yes. All disks are LUKS encrypted and are not exposed to the public internet (hence the Cloudflared web-terminal). Btrfs (the filesystem I use) uses checksums to verify the integrity of all files and prevent bitrot, and attempt to restore files if issues are found.

---
### I have another question.

Contact me at **[sysadmin@rbitton.com](mailto:sysadmin@rbitton.com)** using your **institutional email address** with your username and question and I'll be happy to respond.
