plugin "terraform" {
  enabled = true
  preset  = "all"
}
plugin "aws" {
  enabled = true
  version = "0.48.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
plugin "style-guide" {
  enabled = true
  version = "0.3.0"
  source  = "github.com/miztch/tflint-ruleset-style-guide"
}
