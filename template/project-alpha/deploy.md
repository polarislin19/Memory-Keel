# Project Alpha — Deployment

## Server
- Provider: [e.g., AWS EC2, Hetzner, DigitalOcean]
- Region: [e.g., us-east-1]
- IP: [redacted]
- OS: Ubuntu 24.04 LTS

## Services

| Service | Port | Managed By | Status |
|---------|------|------------|--------|
| Nginx | 80/443 | systemd | Running |
| Backend API | 8001 | systemd (`project-alpha.service`) | Running |
| Redis | 6379 | systemd | Running |

## Domains & DNS

| Domain | Provider | Notes |
|--------|----------|-------|
| example.com | [e.g., Namecheap] | Primary domain |
| api.example.com | [same] | API subdomain (if separate) |

## SSL
- Provider: Let's Encrypt (certbot)
- Auto-renewal: Yes (systemd timer)

## Environment Variables

All sensitive config in `/opt/project-alpha/.env`:

```
REDIS_URL=redis://localhost:6379/0
SECRET_KEY=[redacted]
PAYMENT_API_KEY=[redacted]
PAYMENT_WEBHOOK_SECRET=[redacted]
EMAIL_API_KEY=[redacted]
REPORT_BASE_URL=https://example.com/report/
```

**Never commit `.env` to git.** Template: `.env.example` with dummy values.

## Deploy Process

```bash
# 1. Pull latest code
cd /opt/project-alpha
git pull origin main

# 2. Install dependencies
uv pip install -r requirements.txt

# 3. Restart service
sudo systemctl restart project-alpha

# 4. Verify
curl -s https://example.com/api/health | jq .
```

## Backup
- Code: GitHub (primary)
- Reports: Not backed up (generated on-the-fly, expire after 90 days)
- Redis: Not backed up (session data only, acceptable to lose)

## Monitoring
- Uptime: [e.g., UptimeRobot]
- Logs: journalctl
- Alerts: Email on service failure

## Known Issues
- PDF generation can timeout for reports with >100 findings → paginate if needed
- Redis occasionally hits memory limit under load → monitor with `INFO memory`
