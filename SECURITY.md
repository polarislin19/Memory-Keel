# Security Policy

## Reporting a Vulnerability

Memory Keel is a file template — it contains no executable code, no server, no runtime. There are no authentication tokens, API keys, or network endpoints.

If you discover a security concern (for example, a template that could encourage unsafe practices, or a scaffold script that does something unexpected):

- **Do not open a public issue.**
- Email the maintainer directly with details.

## Scope

This policy covers:
- The scaffold script (`scripts/scaffold.sh`)
- Template content that could mislead users into unsafe practices
- Documentation that recommends insecure workflows

This policy does **not** cover:
- Security of project files created by users using Memory Keel templates
- Accidental exposure of sensitive data in user-created project files
- The user's git hosting platform or local filesystem

## Best Practices for Users

When using Memory Keel to document your projects:

- Never store API keys, tokens, or passwords in your memory-keel files
- Use environment variables or a `.env` file (and add `.env` to `.gitignore`)
- Never commit customer data or personal information to your memory-keel files
- Run a grep for common secret patterns before committing:
  ```bash
  grep -rE '(api_key|token|secret|password|private_key)' memory-keel/ --include="*.md"
  ```
- Add `memory-keel/` to your project's security scanning rules for secret detection

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | ✅                 |

## Acknowledgments

We appreciate responsible disclosure. Thank you for helping keep the community safe.
