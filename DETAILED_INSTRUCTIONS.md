# Detailed Instructions for Azure DevOps Bulk Variable Creator

This document provides a step-by-step guide on how to use the Azure DevOps Bulk Variable Creator to add multiple variables to a Variable Group using Azure DevOps CLI.

## Step 0: Login to Azure DevOps from Command Line

Before starting, authenticate using your Azure DevOps credentials:

```bash
az login
```

Or authenticate using a Personal Access Token (PAT).

## Step 1: Set Default Organization and Project

Set the default organization:

```bash
az devops configure -d organization=https://dev.azure.com/<OrganizationName>
```

Set the default project:

```bash
az devops configure -d project=<ProjectName>
```

## Step 2: Create a Variable Group

1. Navigate to Pipelines → Library in Azure DevOps portal
2. Click on "+ Variable Group"
3. Provide a name for the Variable Group
4. Add at least one test variable
5. Click "Save"

## Step 3: Retrieve the Variable Group ID

After creating the Variable Group, note the ID from the URL.

## Step 4: Create Your First Test Variable Using Azure DevOps CLI

Run the following command to create a test variable:

```bash
az pipelines variable-group variable create --group-id <YOUR_GROUP_ID> --name "Testkey2" --value "Testvalue2"
```

## Step 5: Generate Azure DevOps CLI Commands Using Excel

1. Open the `generate_commands.xlsx` file
2. In column E, use the following formula:
   ```
   =CONCAT("az pipelines variable-group variable create --group-id <YOUR_GROUP_ID> --name """,C2,""" --value """,D2,"""")
   ```
3. Apply this formula to all rows with variables

## Step 6: Execute the Azure DevOps CLI Commands

1. Copy all the generated commands from Excel
2. Save them in a text file, e.g., `commands.txt`
3. Run the `bulk_variable_creator.sh` script:
   ```bash
   ./bulk_variable_creator.sh commands.txt
   ```

## Step 7: Review the Output and Delete Test Variables

1. Navigate to the Variable Group in Azure DevOps portal
2. Refresh the page to view all the new variables
3. Delete any test variables you created during the process

## Troubleshooting

- If you encounter permission issues, ensure you have the necessary rights in Azure DevOps
- For any CLI errors, check the Azure DevOps CLI documentation or run the command with `--debug` for more information

Remember to handle sensitive information with care and follow your organization's security policies when dealing with variables and secrets.
