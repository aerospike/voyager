# [PROJECT_NAME]

> **Note:** This is a template repository. When creating a new repository from this template, run `./setup.sh` to configure it for your project. See [SETUP.md](SETUP.md) for details.

<!-- Brief description of what your project does -->

## Getting Started

### Development Setup

<!-- Add project-specific setup instructions here -->

```bash
# Clone the repository
git clone https://github.com/aerospike/[REPOSITORY_NAME].git
cd [REPOSITORY_NAME]

# If this is a new repo from the template, run the setup script first:
./setup.sh

# Add your setup steps here
```

## Project Structure

<!-- Describe your project structure here -->

```text
.
├── .github/
│   ├── workflows/
│   │   ├── cicd.yaml          # Artifacts CI/CD pipeline (build → sign → deploy)
│   │   ├── pr-hygiene.yml     # JIRA ticket check on PRs
│   │   └── trunk.yml          # Trunk Check linting
│   └── dependabot.yml         # Dependabot configuration
├── setup.sh                   # Template setup script (delete after use)
├── SETUP.md                   # Template customization guide (delete after use)
└── ...
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## Security

For information on reporting security vulnerabilities, please see [SECURITY.md](SECURITY.md).

## Repo Tooling

See [CONTRIBUTING.md](CONTRIBUTING.md) for details on repo tooling and development environment setup.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Support

<!-- Add support information here -->

For questions or issues, please:

- Open an issue on GitHub
- Check existing documentation
- Contact the maintainers

---

**Remember to customize this README for your specific project!**
