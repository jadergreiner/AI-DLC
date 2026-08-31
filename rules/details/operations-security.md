# Operations: Security & Hardening

Security is a foundational pillar across all phases of AI-DLC and must be formally validated prior to release.

---

## 1. Security Tenets

1. **Least Privilege**: Services and users must operate with the minimal set of permissions required.
2. **Never Commit Secrets**: Zero tolerance for hardcoded passwords, API tokens, or cryptographic keys.
3. **Defense in Depth**: Validate and sanitize all external inputs, enforce authentication, and authorize operations at the domain layer.

---

## 2. Pre-Release Security Audit Checklist

### Credential & Secret Management
- [ ] No API keys, JWT secrets, passwords, or certificates committed in source code or history.
- [ ] Sensitive configuration values read strictly from environment variables or secure secret managers.
- [ ] `.gitignore` properly excludes local `.env` and credential files.

### Input Validation & Sanitization
- [ ] All HTTP payloads, query params, and headers are schema-validated (e.g., Zod, Pydantic, Joi).
- [ ] Database queries parameterized to prevent SQL Injection.
- [ ] HTML output properly escaped to prevent Cross-Site Scripting (XSS).

### Dependencies & Vulnerabilities
- [ ] Run dependency vulnerability audit (e.g., `npm audit`, `pip-audit`, `cargo audit`).
- [ ] No critical or high unpatched CVEs in the dependency tree.

### Transport & Storage Security
- [ ] TLS enforced for all external communications.
- [ ] Passwords hashed with modern adaptive algorithms (Argon2id, bcrypt, scrypt).
