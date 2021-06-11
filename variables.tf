variable token {}
variable base_url {
    description = "Only used if you are conencting to GHE"
    type = string
    default = ""
}

variable module_list {
    description = "value"
    type = list
    default = ["s3","ec2","rds","dynamodb","efs"]
}

variable branches {
    description = "List of trunks for branching"
    type = list
    default = ["master","staging","dev"]
}

variable tfversions {
    description = "Map of supported terraform versions"
    type = list
    default = ["v14"]
}

variable tfversionbranching {
    description = "Do you want the repo branching to be features or terraform versions"
    type = bool
    default = false

}

variable topics {
    description = "A list of the topics (aka tags) to go on the repository in addition to the ones based on the service/tf version"  
    type = list
    default = ["terraform", "hcl", "my-organisation"]
}

variable create_private {
  description = "Are you creating private or public repos"
  type = bool
  default = true
}

variable gitignore_template {
  description = "Use the name of the template without the extension."
  type = string
  default = "Terraform"
}