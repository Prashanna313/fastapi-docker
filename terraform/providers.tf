provider "aws" {
  default_tags {
    tags = {
      Application = var.app
      CostCenter  = var.cost_center
      Environment = var.environment
      Owner       = var.owner
    }
  }

  region = var.region
}
