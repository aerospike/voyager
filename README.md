# Voyager — Aerospike Data Browser

Voyager is a desktop application for exploring and managing data in [Aerospike](https://aerospike.com) databases. Connect to any local or self-managed cluster, browse namespaces and sets, inspect records with full CDT (Collection Data Type) support, and perform safe CRUD operations — all from a native GUI.

## Features

- **Connect** to localhost, IP-accessible, and self-hosted cloud (AWS/GCP) clusters with optional TLS and authentication
- **Browse data** hierarchically: Namespaces → Sets → Records
- **Inspect records** including metadata (TTL, generation, digest, partition ID) and nested List/Map structures
- **Filter records** using Aerospike server-side expressions — key/digest lookup, bin filters, CDT filters, metadata filters, logical AND/OR
- **Edit records** inline with type preservation, create new records, delete records or individual bins
- **Upload sample data** to quickly explore Aerospike capabilities with pre-built datasets
- **Built-in safety** — confirmation dialogs for destructive operations, generation-based conflict detection, full-scan protection
- **Auto-update** — checks for new releases and updates in place

## Supported Platforms

| Platform | Architecture | Format |
|---|---|---|
| MacOS | Intel (amd64) | `.dmg` |
| MacOS | Apple Silicon (arm64) | `.dmg` |
| Linux | amd64 | `.deb`, `.rpm` |
| Linux | arm64 | `.deb`, `.rpm` |
| Windows | amd64 | Installer (`.exe`) |
| Windows | arm64 | Installer (`.exe`) |

## Installation

Download the latest release for your platform from the [Releases](https://github.com/aerospike/voyager/releases) page.

### MacOS

1. Download the `.dmg` file for your architecture
2. Open the DMG and drag **Voyager** to your Applications folder
3. Launch Voyager from Applications

> On first launch, macOS may show a security prompt. The application is signed and notarized by Aerospike.

### Linux

**Debian / Ubuntu (.deb):**

```bash
sudo dpkg -i voyager-linux-amd64-*.deb
```

**RHEL / Fedora (.rpm):**

```bash
sudo rpm -i voyager-linux-amd64-*.rpm
```

### Windows

1. Download the installer (`.exe`) for your architecture
2. Run the installer and follow the prompts
3. Launch Voyager from the Start Menu or Desktop Shortcut

## Compatibility

- Aerospike Server 6.x, 7.x, 8.x

## Getting Started

1. Launch Voyager
2. Click **Add Connection** and enter your cluster's host and port (default: `127.0.0.1:3000`)
3. Optionally configure TLS certificates and authentication credentials
4. Click **Test Connection** to verify connectivity, then **Save**
5. Start browsing your namespaces, sets, and records

If you don't have data yet, use the **Upload Sample Data** feature to load pre-built datasets and start exploring right away.

## License

[MIT](LICENSE)
