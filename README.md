# Cloud Platform IaC Demo (Azure + Terraform)

This repo demonstrates a clean, enterprise-style Infrastructure-as-Code (IaC) pattern for deploying Azure foundational networking using Terraform. It’s designed to show best practices around **reusability**, **environment isolation**, and **safe change workflows**.

## What This Lab Demonstrates
- Terraform **module-based design** (reusable infrastructure building blocks)
- Multi-environment structure (**dev / qa / prod**) using environment “root” configs
- Azure Blob Storage **remote state backend** with automatic state locking (blob lease)
- Consistent tagging strategy for governance and cost tracking
- Plan-first workflow to reduce risk (review plan output before applying)

## Architecture (Deployed Resources)
For the `dev` environment, Terraform deploys:
- Resource Group: `rg-mohawk-demo-dev`
- Virtual Network: `vnet-mohawk-demo-dev`
- Subnets:
  - `snet-app` (10.10.1.0/24)
  - `snet-data` (10.10.2.0/24)
- NSGs:
  - `vnet-mohawk-demo-dev-nsg-app`
  - `vnet-mohawk-demo-dev-nsg-data`
- Example NSG rule:
  - Allow inbound HTTPS (TCP 443) to app subnet (demo rule)

## Repo Structure
```text
cloud-platform-iac-demo/
  modules/
    rg/                # Resource group module
    network/           # VNet, subnets, NSGs, rules
  env/
    dev/               # Dev root config + backend key dev.tfstate
    qa/                # QA root config + backend key qa.tfstate
    prod/              # Prod root config + backend key prod.tfstate
  docs/                # (optional) runbooks/notes
  .github/workflows/   # (Lab #2) CI/CD workflows go here