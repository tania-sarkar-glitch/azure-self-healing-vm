# GitHub OIDC Authentication

## Overview

This project uses GitHub Actions with OpenID Connect (OIDC) for secure authentication to Azure.

Unlike service principal secrets, OIDC provides short-lived access tokens issued by Microsoft Entra ID.

## Benefits

- No client secrets stored in GitHub
- Short-lived authentication tokens
- Enterprise security best practice
- Least privilege access

## Azure Configuration (To Be Completed)

1. Register an App in Microsoft Entra ID.
2. Create a Federated Credential for the GitHub repository.
3. Assign the required RBAC roles.
4. Configure the GitHub repository secrets:
   - AZURE_CLIENT_ID
   - AZURE_TENANT_ID
   - AZURE_SUBSCRIPTION_ID

## References

- GitHub Actions OIDC
- Azure Workload Identity Federation