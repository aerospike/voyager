# Template Setup Guide

## Quick Start

1. Create a new repository from this template
2. Clone your new repository
3. Run `./setup.sh` and follow the prompts
4. Review the remaining manual steps printed by the script
5. Delete `setup.sh` and this file (the script offers to do this automatically)

## Template Values

The template ships with working test values for its own CI/CD pipeline.
When you run `setup.sh`, these are replaced with your project's values.

| Template Value      | Location                         | Description                            |
| ------------------- | -------------------------------- | -------------------------------------- |
| `test`              | cicd.yaml (`jf-project`)         | JFrog Artifactory project name         |
| `test-build`        | cicd.yaml (`jf-build-name`)      | JFrog build identifier                 |
| `gh-dev-test`       | cicd.yaml (`oidc-provider-name`) | JFrog OIDC provider for GitHub Actions |
| `aerospike/testing` | cicd.yaml (`oidc-audience`)      | OIDC audience claim                    |
| `[PROJECT_NAME]`    | README.md, CONTRIBUTING.md       | Human-readable project name            |
| `[REPOSITORY_NAME]` | README.md                        | GitHub repository name                 |
| `CODEOWNERS`        | .github/CODEOWNERS               | Team/user who owns the code            |

## Required GitHub Secrets

Add these secrets in your repository settings (Settings > Secrets and variables > Actions):

### Required (artifact signing)

| Secret           | Description                           |
| ---------------- | ------------------------------------- |
| `GPG_SECRET_KEY` | GPG private key for signing artifacts |
| `GPG_PUBLIC_KEY` | GPG public key                        |
| `GPG_PASS`       | GPG key passphrase                    |

### Optional (NuGet package signing via SSL.com)

| Secret           | Description              |
| ---------------- | ------------------------ |
| `ES_USERNAME`    | SSL.com eSigner username |
| `ES_PASSWORD`    | SSL.com eSigner password |
| `CREDENTIAL_ID`  | SSL.com credential ID    |
| `ES_TOTP_SECRET` | SSL.com TOTP secret      |

## Customizing the Build Script

The `build-script` in `.github/workflows/cicd.yaml` creates a dummy artifact.
Replace it with your actual build commands:

```yaml
build-script: |
  set -euo pipefail
  # Your build commands here
  make build
```

The script runs with these environment variables available:

- `MATRIX_JSON` — JSON object with current matrix values (distro, arch, etc.)
- Any variables from the `build-env` input
- You **must** `export` variables for child processes (make, docker) to see them

## Multi-Platform Builds

To build for multiple distros/architectures, add `matrix-json` to the cicd job:

```yaml
matrix-json: >-
  {"include":[
    {"runs-on":"ubuntu-22.04","distro":"jammy","arch":"x86_64"},
    {"runs-on":"ubuntu-22.04","distro":"el9","arch":"x86_64"}
  ]}
```

## Versioning

The CI/CD pipeline uses the `extract-version-from-tag` action to determine the
artifact version. During setup you choose one of two strategies:

- **VERSION file** (default) — The version is read from the `VERSION` file at
  the repo root. Update this file when you want to bump the version.
- **Git tags** — The version is extracted from git tags (e.g., `v1.2.3` becomes
  `1.2.3`). Push a tag to trigger a versioned release.

You can switch strategies at any time: delete the VERSION file to use tags, or
create one to override tags.

## Dependabot

The template has Dependabot configured for GitHub Actions updates.
Uncomment the appropriate section in `.github/dependabot.yml` for your
package ecosystem (pip, npm, gomod, or docker).

## Shared Workflows Version

The CI/CD workflows reference
[aerospike/shared-workflows](https://github.com/aerospike/shared-workflows)
at a specific commit SHA. Dependabot will propose updates when new versions
are released.

## Workflows Overview

| Workflow         | Trigger                 | Purpose                                    |
| ---------------- | ----------------------- | ------------------------------------------ |
| `cicd.yaml`      | Push to main, tags, PRs | Build, sign, and deploy artifacts to JFrog |
| `pr-hygiene.yml` | Pull requests           | Check for JIRA ticket in PR title          |
| `trunk.yml`      | Push to main, PRs       | Trunk Check linting                        |
