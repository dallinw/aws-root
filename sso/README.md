# AWS SSO Configuration

This configuration is very piecemeal and incomplete. The problem lies in a few places which will be detailed.

AWS does not expose automated user provisioning completely via the public API's which are then leveraged by Terraform. This is a problem in that users, groups and their permission set mappings in google SSO are unable to be automated.

Google Workspace also does not work nice with AWS and support SCIM user provisioning.

As such, the main things that can be configured have been via Terraform, and the manual efforts that are needed are the group creation, user creation (email MUST match the email in google workspaces).
