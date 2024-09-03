# Azure DevOps Bulk Variable Creator

This project automates the process of adding multiple variables to an Azure DevOps Variable Group using Azure DevOps CLI. It's particularly useful when you need to add a large number of variables from an Excel sheet to a Variable Group.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Contributing](#contributing)
- [Contact](#contact)

## Features
- Automates the creation of multiple variables in an Azure DevOps Variable Group
- Utilizes Excel formulas to generate Azure DevOps CLI commands
- Reduces manual data entry and potential for human error

## Prerequisites
- Azure CLI installed
- Azure DevOps CLI extension installed
- Microsoft Excel
- Access to Azure DevOps with appropriate permissions

## Setup
1. Install Azure CLI from [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
2. Install Azure DevOps CLI extension:
   ```
   az extension add --name azure-devops
   ```
3. Authenticate with Azure DevOps:
   ```
   az login
   ```
   or use a Personal Access Token (PAT) for authentication

## Usage
1. Set default organization and project:
   ```
   az devops configure -d organization=https://dev.azure.com/<OrganizationName>
   az devops configure -d project=<ProjectName>
   ```
2. Create a Variable Group in Azure DevOps portal
3. Retrieve the Variable Group ID
4. Use the Excel formula provided in `generate_commands.xlsx` to create CLI commands
5. Execute the generated commands using `bulk_variable_creator.sh`

For detailed instructions, refer to [DETAILED_INSTRUCTIONS.md](./DETAILED_INSTRUCTIONS.md)

## File Structure
- `README.md`: This file
- `bulk_variable_creator.sh`: Shell script to execute Azure DevOps CLI commands
- `generate_commands.xlsx`: Excel file with formula to generate CLI commands
- `DETAILED_INSTRUCTIONS.md`: Detailed explanation of the process

## Contributing
Contributions to improve the Azure DevOps Bulk Variable Creator are welcome. Please follow these steps:
1. Fork the repository
2. Create a new branch for your feature
3. Commit your changes
4. Push to your branch
5. Create a new Pull Request

## Contact

Have questions or suggestions? Reach out to us:
- 📧 Email: [Sauravsrivastav2205@gmail.com](mailto:Sauravsrivastav2205@gmail.com)
- 💼 LinkedIn: [in/sauravsrivastav2205](https://www.linkedin.com/in/sauravsrivastav2205)
- 🐙 GitHub: [https://github.com/SauravSrivastav](https://github.com/SauravSrivastav)
