# Operations: Production Readiness & Observability

The **Operations Phase** ensures that the software transitions from working code into a reliable, maintainable, and observable service.

---

## 1. Objectives

- Ensure comprehensive observability (metrics, logs, traces, health checks).
- Provide deployment configuration and database migration instructions.
- Create or update `aidlc-docs/operations-guide.md`.

---

## 2. Structure of `aidlc-docs/operations-guide.md`

```markdown
# Operations & Deployment Guide

## 1. Environment Variables & Configuration
| Variable Name | Required | Default | Description |
|---|---|---|---|
| `PORT` | No | `8080` | HTTP server listening port |
| `DATABASE_URL` | Yes | - | PostgreSQL connection string |
| `LOG_LEVEL` | No | `info` | Logging verbosity (debug, info, warn, error) |

## 2. Prerequisites & Dependencies
- Node.js >= 20.x / Python >= 3.11 / Go >= 1.22
- PostgreSQL 15+

## 3. Database Migrations
```bash
npm run db:migrate
```

## 4. Health Checks & Diagnostics
- Liveness Probe: `GET /health/live` (returns HTTP 200)
- Readiness Probe: `GET /health/ready` (verifies database connectivity)

## 5. Observability & Logging
- Log output: JSON structured logs to stdout.
- Key metrics emitted: `http_requests_total`, `request_duration_seconds`.

## 6. Rollback & Troubleshooting Procedures
- In case of deployment failure:
  1. Rollback image tag to previous version.
  2. If migration occurred, run `npm run db:rollback`.
```

---

## 3. Operations Checklist

- [ ] Health endpoints implemented and responsive.
- [ ] Structured logging configured (no unstructured raw strings in production).
- [ ] Graceful shutdown handlers configured (handling `SIGINT` / `SIGTERM`).
