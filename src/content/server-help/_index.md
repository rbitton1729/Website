+++
title = "Server Help"
sort_by    = "date"
sort_order = "desc"
+++

# Server Help

This page contains instructions on how to access my servers in **Chicago, IL** and **Irvine, CA**, available to **University of Chicago** and **UC Irvine** students and faculty.

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
   - Your request will be routed to the appropriate server based on your email domain (i.e. @uchicago.edu vs @uci.edu).
   - You’ll receive a one-time authentication code by email.  
3. Once authenticated, you’ll be prompted for your **username** (your CNet ID or UCInetID).
4. Use the **temporary password** sent to you in your confirmation email.

When you first log in, you’ll immediately be prompted to change your password.  
Your new password must meet the following requirements:  
**Minimum 10 characters, including at least two of: uppercase, lowercase, number, or special character.**

---

## FAQ

### I want to use Python

The servers run **Arch Linux (btw)**, which means Python is always up to date — often *too* up to date.  
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

Then use docker as normal (no sudo).

If you'll be using Docker often, add this to you shell's rc file:

```shell
# For Bash:
echo 'export DOCKER_HOST=unix:///run/user/$UID/docker.sock' >> ~/.bashrc

# For Zsh:
echo 'export DOCKER_HOST=unix:///run/user/$UID/docker.sock' >> ~/.zshrc
```
---

### I want to use something else

Please let me know at the email at the bottom of this page. I will look into it and let you know. Most likely if it seems to benifit multiple users I will install it.

---

### I deleted something important, is there anything I can do?

Yes. All home folders are snapshoted every hour on the hour and are recoverable for a certain period of time. Contact me at **[sysadmin@rbitton.com](mailto:sysadmin@rbitton.com)** using your **institutional email address** and I can help you recover your file. 

**Please note that this should not replace version control (i.e. git), as snapshots are only kept for a certain time after creation and at certain intervals thereafter.**

---

### Are my files safe?
Yes. All disks are LUKS encrypted and are not exposed to the public internet (hence the Cloudflared web-terminal).

---
### I have another question.

Contact me at **[sysadmin@rbitton.com](mailto:sysadmin@rbitton.com)** using your **institutional email address** with your username and question and I'll be happy to respond.
