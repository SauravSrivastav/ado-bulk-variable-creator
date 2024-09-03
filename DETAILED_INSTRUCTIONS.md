# Detailed Instructions for Azure DevOps Bulk Variable Creator

This document provides a step-by-step guide on how to use the Azure DevOps Bulk Variable Creator to add multiple variables to a Variable Group using Azure DevOps CLI.

![Azure DevOps CLI Overview](https://github.com/user-attachments/assets/9ff7139f-6f30-4af1-a2de-c48a7d1f9379)

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

![Navigate to Variable Groups](https://github.com/user-attachments/assets/f02ac83f-c9ea-4fc7-ad94-aa725f09bbde)

![Create Variable Group](https://github.com/user-attachments/assets/1ae5dfe8-3a41-484a-8c0d-b701b3cb2eb6)

1. Navigate to Pipelines → Library in Azure DevOps portal
2. Click on "+ Variable Group"
3. Provide a name for the Variable Group
4. Add at least one test variable
5. Click "Save"

## Step 3: Retrieve the Variable Group ID

![Retrieve Variable Group ID](https://github.com/user-attachments/assets/5005acba-81d4-4cc3-8ccb-db185f5cbc6b)

After creating the Variable Group, note the ID from the URL.

## Step 4: Create Your First Test Variable Using Azure DevOps CLI

![Create Test Variable](https://github.com/user-attachments/assets/8ff48db7-6205-4cb2-bbe6-aeb583d55de5)

Run the following command to create a test variable:

```bash
az pipelines variable-group variable create --group-id <YOUR_GROUP_ID> --name "Testkey2" --value "Testvalue2"
```

![Test Variable Created](https://github.com/user-attachments/assets/e091c483-25c5-423e-8c52-c892a925bdfe)

## Step 5: Generate Azure DevOps CLI Commands Using Excel

1. Open the `generate_commands.xlsx` file
2. In column E, use the following formula:

   ```
   =CONCAT("az pipelines variable-group variable create --group-id <YOUR_GROUP_ID> --name """,C2,""" --value """,D2,"""")
   ```

   ![Excel Formula](https://github.com/user-attachments/assets/ade59a19-9e73-4892-bdbe-fdf561900838)

3. Apply this formula to all rows with variables

## Step 6: Execute the Azure DevOps CLI Commands

1. Copy all the generated commands from Excel
2. Save them in a text file, e.g., `commands.txt`
3. Run the `bulk_variable_creator.sh` script:

   ```bash
   ./bulk_variable_creator.sh commands.txt
   ```

![Execute Commands](https://github.com/user-attachments/assets/075f0ade-ad20-4110-813e-f3ce18695880)

## Step 7: Review the Output and Delete Test Variables

![Review Variables](https://github.com/user-attachments/assets/5efdae8f-b209-4f70-a5f1-92728f271ea3)

1. Navigate to the Variable Group in Azure DevOps portal
2. Refresh the page to view all the new variables
3. Delete any test variables you created during the process

## Troubleshooting

- If you encounter permission issues, ensure you have the necessary rights in Azure DevOps
- For any CLI errors, check the Azure DevOps CLI documentation or run the command with `--debug` for more information

Remember to handle sensitive information with care and follow your organization's security policies when dealing with variables and secrets.
