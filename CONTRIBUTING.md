# Contributing to [PROJECT_NAME]

Thank you for your interest in contributing to this Aerospike project! We welcome contributions from the community.

## How to Contribute

### **Did you find a bug?**

- **Do not open up a GitHub issue if the bug is a security vulnerability**, and instead refer to our [security policy](SECURITY.md)

- If you're unable to find an open issue addressing the problem, be sure to include a **title and clear description**, as much relevant information as possible, and a **code sample** or an **executable test case** demonstrating the expected behavior that is not occurring.

### **Did you write a patch?**

- Open a new GitHub pull request with the patch.

- Ensure the PR description clearly describes the problem and solution. Include the relevant issue number if applicable.

## Development Setup

### Repo Tooling

Linting will be run on PRs; you can save yourself some time and annoyance by linting as you write.

If you use Visual Studio Code or a derivative, there are suggested extensions in the [.vscode](.vscode) directory.

### Trunk

Trunk can also be run as a CLI. Once installed, you can run `trunk git-hooks sync` to check and make sure that your code will pass CI.

### Linter notes

`kennylong.kubernetes-yaml-formatter`: **Do NOT install or enable this extension.** It is marked as unwanted in `.vscode/extensions.json` because it conflicts with Trunk and Prettier on YAML formatting rules. If you have yaml format-on-save enabled with kennylong's extension, `trunk check|fmt` will complain about it.

`streetsidesoftware.code-spell-checker`: This isn't enabled via trunk and you should run it in your editor of choice. Trunk marks all misspelled words as errors, when they should properly be notes (blue squiggles, not red squiggles).

### Contributor

This project adheres to the Contributor Covenant [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## Questions?

Feel free to open an issue with your question.

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (see [LICENSE](LICENSE)).
