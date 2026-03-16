#!/usr/bin/env bash
set -euo pipefail

# Template setup script for aerospike-repo
#
# Run this after creating a new repository from the aerospike-repo template.
# It replaces the template's working test values with your project's values.

echo "=== Aerospike Repository Template Setup ==="
echo ""
echo "This script replaces the template's default values with your project's values."
echo "Press Ctrl+C to cancel at any time."
echo ""

# --- Collect values ---

REPO="$(git rev-parse --show-toplevel)"
cd "$REPO"
REPO_NAME=$(basename "$REPO")
echo "Repository: ${REPO_NAME}"
echo ""

read -rp "Project display name (default: ${REPO_NAME}): " PROJECT_NAME
PROJECT_NAME="${PROJECT_NAME:-${REPO_NAME}}"

read -rp "JFrog project name (default: test): " JF_PROJECT
JF_PROJECT="${JF_PROJECT:-test}"

read -rp "JFrog build name (default: test-build): " JF_BUILD_NAME
JF_BUILD_NAME="${JF_BUILD_NAME:-test-build}"

read -rp "OIDC provider name (default: gh-dev-test): " OIDC_PROVIDER
OIDC_PROVIDER="${OIDC_PROVIDER:-gh-dev-test}"

read -rp "OIDC audience (default: aerospike/testing): " OIDC_AUDIENCE
OIDC_AUDIENCE="${OIDC_AUDIENCE:-aerospike/testing}"

echo ""
read -rp "GitHub CODEOWNERS (e.g., '@aerospike/team-name'): " CODEOWNERS_VALUE


# --- Replace CI/CD values in workflow files ---

replace_in_file() {
    local file="$1"
    local old="$2"
    local new="$3"
    if [[ -f "$file" ]]; then
        # Escape characters special in sed replacement: backslash, ampersand, delimiter
        local new_escaped="${new//\\/\\\\}"
        new_escaped="${new_escaped//&/\\&}"
        new_escaped="${new_escaped//|/\\|}"
        sed "s|${old}|${new_escaped}|g" "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
    fi
}

# cicd.yaml: replace JFrog and OIDC values
CICD_FILE=".github/workflows/cicd.yaml"
replace_in_file "$CICD_FILE" "jf-project: test" "jf-project: ${JF_PROJECT}"
replace_in_file "$CICD_FILE" "jf-build-name: test-build" "jf-build-name: ${JF_BUILD_NAME}"
replace_in_file "$CICD_FILE" "oidc-provider-name: gh-dev-test" "oidc-provider-name: ${OIDC_PROVIDER}"
replace_in_file "$CICD_FILE" "oidc-audience: aerospike/testing" "oidc-audience: ${OIDC_AUDIENCE}"

# --- Replace project name placeholders in markdown files ---

PROJECT_NAME_ESCAPED="${PROJECT_NAME//\\/\\\\}"
PROJECT_NAME_ESCAPED="${PROJECT_NAME_ESCAPED//&/\\&}"
PROJECT_NAME_ESCAPED="${PROJECT_NAME_ESCAPED//|/\\|}"
REPO_NAME_ESCAPED="${REPO_NAME//\\/\\\\}"
REPO_NAME_ESCAPED="${REPO_NAME_ESCAPED//&/\\&}"
REPO_NAME_ESCAPED="${REPO_NAME_ESCAPED//|/\\|}"
find . -name "*.md" -not -path "./.git/*" -print0 | while IFS= read -r -d '' file; do
    sed "s|\[PROJECT_NAME\]|${PROJECT_NAME_ESCAPED}|g" "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
    sed "s|\[REPOSITORY_NAME\]|${REPO_NAME_ESCAPED}|g" "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
done

# --- Generate CODEOWNERS ---

cat > .github/CODEOWNERS <<EOF
* ${CODEOWNERS_VALUE}
EOF

echo "  Updated .github/workflows/cicd.yaml"
echo "  Updated markdown files with project name"
echo "  Generated .github/CODEOWNERS"

echo ""
echo "=== Setup complete! ==="
echo ""
echo "Remaining manual steps:"
echo ""
echo "  1. Update the build-script in .github/workflows/cicd.yaml"
echo "     The current script creates a dummy artifact. Replace it with your"
echo "     actual build commands."
echo ""
echo "  2. Uncomment your package ecosystem in .github/dependabot.yml"
echo "     (pip, npm, gomod, or docker)"
echo ""
echo "  3. Review and customize README.md for your project"
echo ""
echo "  4. (Optional) Add matrix-json to cicd.yaml for multi-distro builds"
echo ""
echo "For CI/CD documentation, see:"
echo "  https://github.com/aerospike/shared-workflows/"
