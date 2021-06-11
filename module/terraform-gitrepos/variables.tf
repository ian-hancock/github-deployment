variable "module_list" {
  description = "value"
  type        = list(string)
}

variable "branches" {
  description = "List of trunks for branching"
  type        = list(string)
  default     = ["prod", "test", "dev"]
}

variable "tfversions" {
  description = "What version of terraform is this related to"
  type        = string
}

variable "tfversionbranching" {
  description = "Do you want the repo branching to be features or terraform versions"
  type        = bool
  default     = true

}

variable "topics" {
  description = "A list of the topics (aka tags) to go on the repository in addition to the ones based on the service/tf version"
  type        = list(string)
}

variable "create_private" {
  description = "Are you creating private or public repos"
  type        = bool
}

variable "auto_init" {
  description = "Set to true to produce an initial commit in the repository"
  type        = bool
  default     = true
}

variable default_branch {
    description = "Name of the default branch of the repo. Required for the branch module to work"
    type = string
    default = "main"
}

variable gitignore_template {
  description = "Use the name of the template without the extension."
  type = string
}