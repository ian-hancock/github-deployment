output repos {
    value = github_repository.terraformrepos[*].name
}

output branches {
    value = concat(github_branch.prod[*].id,github_branch.test[*].id,github_branch.dev[*].id)  
}

# output branchref {
#   value = module.branches[*].ref
# }
