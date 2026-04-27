# Aerospike Voyager (Preview)

Voyager is the visual workspace for Aerospike that takes you from first Aerospike connection to production code in one tool. **Currently in Preview** for macOS, Windows, and Linux.

## Share feedback

**This repo exists to collect feedback during Preview.** That is its primary purpose.

- [File an issue](https://github.com/aerospike/voyager/issues/new?template=bug_report.md) to report a bug, request a feature, or share any reaction.
- Browse [open issues](https://github.com/aerospike/voyager/issues) first so we can consolidate common themes.
- Rough sketches, half-formed thoughts, and "this felt weird" notes are all welcome.

## What Voyager does

- **Connect** to local, self-hosted, or cloud Aerospike clusters, with optional TLS and authentication.
- **Browse** namespaces, sets, and records hierarchically, including nested List and Map (CDT) structures.
- **Filter** records using Aerospike Expression Language, either through a visual builder or by writing the expression directly. The same string pastes into your Java or Python SDK via `.where(...)`.
- **Edit** records inline with type preservation. Create and delete records or individual bins.
- **Upload sample datasets** to explore Aerospike capabilities without setting up your own data first.
- **Cancel long-running scans** mid-flight. Configurable query timeouts keep exploration from turning into an incident.
- **Query from AI agents.** An embedded MCP server lets Claude Code, Cursor, or any MCP client hit your cluster in the same expression language, with a Read-Only profile by default.
- **Auto-update** to the latest Preview build.

## Get Voyager

Download and the full product walkthrough: **[aerospike.com/products/voyager](https://aerospike.com/products/voyager)**.

## Learn Voyager

Quickstart, reference, and guides: **[aerospike.com/docs/database/tools/voyager](https://aerospike.com/docs/database/tools/voyager/)**.

## License

[MIT](LICENSE)
