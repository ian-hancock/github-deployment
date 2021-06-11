# resource github_branch trunk {
#   count = length(var.branches)
#   repository = trimprefix(var.repository,"/")
#   branch     = var.branches[count.index]
#   source_branch = var.source_branch
# }

resource github_branch trunk {
  count = length(var.repository)
  repository = var.repository[count.index]
  branch     = var.branch
  source_branch = var.source_branch
}

output ref {
  value = github_branch.trunk[*].ref
}
