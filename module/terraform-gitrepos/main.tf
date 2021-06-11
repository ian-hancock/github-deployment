resource "github_repository" "terraformrepos" {
  count                = length(var.module_list)
  name                 = "${var.module_list[count.index]}-${var.tfversions}"
  description          = "Standard organisational terraform blueprint for ${var.module_list[count.index]} in ${var.tfversions}"
  visibility           = var.create_private ? "private" : "public"
  vulnerability_alerts = var.create_private ? null : true
  auto_init            = var.auto_init
  topics               = concat(var.topics, split("-", var.module_list[count.index]), [lower(var.tfversions)])
  gitignore_template   = var.gitignore_template
}

// ************************************
// This needs to be modularised but there's an issue with the provider :(
// ************************************

resource "github_branch" "prod" {
  count      = length(github_repository.terraformrepos[*].name)
  repository = github_repository.terraformrepos[count.index].name
  branch     = "prod"
}

resource "github_branch" "test" {
  count      = length(github_repository.terraformrepos[*].name)
  repository = github_repository.terraformrepos[count.index].name
  branch     = "test"
}

resource "github_branch" "dev" {
  count      = length(github_repository.terraformrepos[*].name)
  repository = github_repository.terraformrepos[count.index].name
  branch     = "dev"
}

// ************************************

resource "github_branch" "default" {
  count      = var.default_branch == "main" ? 0 : length(github_repository.terraformrepos[*].name)
  repository = github_repository.terraformrepos[count.index].name
  branch     = var.default_branch
}

resource "github_branch_default" "main" {
  count      = var.default_branch == "main" ? 0 : length(github_repository.terraformrepos[*].name)
  repository = github_repository.terraformrepos[count.index].name
  branch     = var.default_branch
  depends_on = [
    github_branch.default
  ]
}

// Error: Need to address the whole trailing slash issue
// Error: Error querying GitHub branch reference /aws-ec2-v14 (refs/heads/main): GET https://api.github.com/repos//aws-ec2-v14/git/ref/heads/main: 404 Not Found []
# module "branches" {
#   source        = "../terraform-gitbranches"
#   count         = length(var.branches)
#   repository    = github_repository.terraformrepos[*].name
#   branch        = var.branches[count.index]
#   source_branch = var.default_branch
#   depends_on = [
#     github_branch_default.main
#   ]
# }
