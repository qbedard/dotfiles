---
name: spacelift
description: General Spacelift usage, Spacelift Terraform provider conventions, and Spacelift MCP integration
---

## Documentation

- Spacelift docs: https://docs.spacelift.io
- Spacelift Terraform provider:
  https://registry.terraform.io/providers/spacelift-io/spacelift/

When looking up Spacelift or its Terraform provider, prefer these sources
over general web searches. Use context7 tools when available for the
Terraform provider docs.

## Spacelift MCP

The Spacelift MCP server is available via `spacectl mcp server`. Use it to
query stacks, runs, policies, and other Spacelift resources directly. Prefer
MCP tools over CLI or API calls when the information is available through
them.

## Terraform Provider

When writing Spacelift Terraform resources:

- Use the `spacelift` provider from `spacelift-io/spacelift`.
- Look up the latest provider version with `get_latest_provider_version`
  before generating code.
- Follow the same Terraform conventions as the `terraform` skill (run
  `terraform fmt`, single-item blocks on one line, no workspaces).
- Spacelift stacks should use `spacelift_stack` resources, not Terraform
  Cloud/Enterprise workspace resources.
- Prefer Spacelift policies (`spacelift_policy`) for access control, plan
  review, and approval workflows over manual processes.
