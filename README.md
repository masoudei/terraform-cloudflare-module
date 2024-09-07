
# Cloudflare Terraform Module

This repository contains a custom Terraform module for managing Cloudflare configurations. The module is designed for reusability, allowing you to manage DNS records, security settings, and other Cloudflare resources efficiently.

## Features

- **DNS Record Management**: Easily configure DNS records for your domains.
- **Security Settings**: Set up firewall rules and other security settings.
- **Provider Configuration**: Set up the Cloudflare provider for seamless integration with your account.
- **Variables Support**: Customize the module behavior using input variables.

## Prerequisites

Before using this module, ensure you have the following:

- [Terraform](https://www.terraform.io/downloads.html) 0.12+ installed.
- A Cloudflare account with API access enabled.
- Proper permissions to manage DNS and security settings for your domains.

## Usage

```hcl
module "cloudflare" {
  source = "<path-to-your-module>"

  # Define your input variables here
  records  = var.records
  zone_id  = var.zone_id
  api_token = var.api_token
}
```

### Example Input Variables

```hcl
variable "records" {
  description = "Array of DNS records"
  type = list(object({
    name    = string
    type    = string
    value   = string
    ttl     = number
    proxied = bool
  }))
}

variable "zone_id" {
  description = "The Cloudflare zone ID for the domain"
  type        = string
}

variable "api_token" {
  description = "API Token for Cloudflare access"
  type        = string
}
```

### Providers

Make sure you configure the Cloudflare provider properly in your `provider.tf` file:

```hcl
provider "cloudflare" {
  api_token = var.api_token
}
```

### Example Provider Configuration (provider.tf)

```hcl
provider "cloudflare" {
  api_token = "your-api-token-here"  # Replace with your Cloudflare API token
}
```

### Outputs

- Outputs can be defined in the `outputs.tf` file.

## Authors

This module is maintained by [Masoud Ehteshami](https://github.com/masoudei).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
