# ADO Bulk Variable Creator

> Automate bulk creation of Azure DevOps Variable Group variables from Excel/CSV — eliminate manual entry for 100s of secrets using Azure DevOps CLI.

[![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-Automation-0078D4?style=flat-square&logo=azure-devops&logoColor=white)](https://dev.azure.com)
[![Bash](https://img.shields.io/badge/Bash-Script-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash)
[![Azure CLI](https://img.shields.io/badge/Azure_CLI-Tool-0078D4?style=flat-square&logo=microsoft-azure&logoColor=white)](https://docs.microsoft.com/cli/azure)

---

## Overview

**ADO Bulk Variable Creator** automates the tedious process of adding hundreds of variables to Azure DevOps Variable Groups — parsing an Excel/CSV source and creating all variables via Azure DevOps CLI in a single script run.

Saves hours of manual work for teams migrating secrets, setting up new environments, or syncing configuration across projects.

---

## Use Cases

- **Environment setup** — Populate Variable Groups from scratch for new projects
- **Secret migration** — Move secrets from Excel/CSV exports to Azure DevOps
- **Multi-environment sync** — Create same variables across Dev, Test, Prod groups
- **Onboarding automation** — Standardize Variable Group setup across teams

---

## How It Works

```
Excel/CSV File
    │
    ▼
Bash Script (bulk_variable_creator.sh)
    │
    ▼
Azure DevOps CLI (az devops)
    │
    ▼
Variable Group — variables created in bulk
```

---

## Files

| File | Description |
|------|-------------|
| `bulk_variable_creator.sh` | Main automation script |
| `DETAILED_INSTRUCTIONS.md` | Step-by-step setup guide |
| `README.md` | This file |

---

## Prerequisites

```bash
# Install Azure CLI
brew install azure-cli         # macOS
# or
winget install Microsoft.AzureCLI  # Windows

# Install Azure DevOps extension
az extension add --name azure-devops

# Authenticate
az login
az devops configure --defaults organization=https://dev.azure.com/YOUR-ORG project=YOUR-PROJECT
```

---

## Quick Start

```bash
git clone https://github.com/SauravSrivastav/ado-bulk-variable-creator.git
cd ado-bulk-variable-creator

# Edit the script with your Variable Group name and CSV path
chmod +x bulk_variable_creator.sh
./bulk_variable_creator.sh
```

---

## Script Overview

```bash
# bulk_variable_creator.sh
while IFS=',' read -r name value secret; do
  az pipelines variable-group variable create \
    --group-id $GROUP_ID \
    --name "$name" \
    --value "$value" \
    --secret $secret
done < variables.csv
```

> Full guide with Excel formula templates in [DETAILED_INSTRUCTIONS.md](./DETAILED_INSTRUCTIONS.md)

---

## Built By

**Saurav Srivastav** — DevOps Manager at Emirates Flight Catering | Azure DevOps · Automation · DevSecOps | Dubai, UAE

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/sauravsrivastav2205/)
[![Portfolio](https://img.shields.io/badge/Portfolio-Visit-0078D4?style=flat-square&logo=vercel)](https://saurav-srivastav-portfolio.vercel.app)

---

<sub>Azure DevOps · Azure CLI · Bash · Automation · DevSecOps · Variable Groups · Secrets · CI/CD · DevOps · Dubai UAE</sub>
