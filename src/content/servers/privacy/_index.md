+++
title = "Server Privacy Policy"
date = 2025-10-22
+++

# Server Privacy Policy

**Last updated:** October 22nd, 2025

## What We Collect
To operate and secure the system, the following data is automatically collected:

- Login times and IP addresses (via Cloudflare Access and SSH logs)
- Basic command history and system logs for troubleshooting
- Resource usage metrics (disk, memory, CPU)
- Hourly filesystem snapshots for recovery

No personal or academic data beyond what’s necessary for authentication is intentionally collected.

## How Data Is Used
- Logs and usage data are used solely for maintenance, debugging, and abuse prevention.
- **Data is never sold, shared, or used for profiling**.
- Snapshots are used only for file recovery and are periodically deleted.

## Account Lifecycle
Accounts are created upon request and approval and remain active until the end of the academic year as defined by the Registrar of the University of Chicago.

If you would like to retain your account afterwards, please let us know by emailing [systems@rbitton.com](mailto:systems@rbitton.com) no later than 9th week of Spring quarter. Accounts that do not request extension or remain inactive may be disabled or deleted without further notice.

**Accounts with no login activity for 60 days will have all data permanently deleted without warning.**

Hourly snapshots are not retained after account deletion.

## Data Retention
System logs are automatically rotated and purged after a limited retention period (typically 30–60 days).  
Snapshots are retained for recovery but not as backups.

## Security
All disks are encrypted with **LUKS** and integrity-checked with **Btrfs**.
External access is restricted to **Cloudflare tunnels** for network isolation.

## Data Access
Only system administrators have access to logs and system data for maintenance purposes. No data is shared with third parties except Cloudflare for authentication and network tunneling.

## Data Breach Notification
In the event of a data breach affecting user accounts, affected users will be notified via email within 72 hours of discovery.

## Your Rights
You may request deletion of your account and home directory at any time by contacting [systems@rbitton.com](mailto:systems@rbitton.com).
