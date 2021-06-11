module terraformrepos {
    count = length(var.tfversions)
    source = "./module/terraform-gitrepos"
    
    module_list = var.module_list
    topics = var.topics
    gitignore_template = var.gitignore_template
    create_private = var.create_private
    tfversions = var.tfversions[count.index]
    }

output repos {
    value = flatten(module.terraformrepos[*].repos)
}



output branch {
    value = sort(flatten(module.terraformrepos[*].branches))
}