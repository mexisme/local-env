# Package List

`//packages/${COMPONENT}/README.md`
`//packages/${COMPONENT}/docs/`
- Any documentation for the package.
- More often, there will be doc-comments inside the code.

`//packages/default.nix`
- Loads all the packages into an attrset, for easier access.

`//packages/aws-cloud-tools`
- AWS CLI tool.
- AWS Workspaces tool, but only on Linux.

`//packages/git-pr-train`
- The "PR Train" extension for Git.

`//packages/python-with-packages`
- Python stable, with `boto3` and `requests` PIPs included.

`//packages/serverless`
- The `serverless` commands and plugins.

`//packages/terraform-versions`
- Provides multiple versions of Terraform, and makes them available in the shell.
- Any version earlier than latest stable will be suffixed with the version, e.g. `terraform-0.13.11`
