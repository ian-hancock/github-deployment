# data github_ip_ranges test {}

# data github_repositories ian-hancock {
#   query = "user:ian-hancock"
# }

# data github_user ian-hancock {
#   username = "ian-hancock"
# }

# output ip {
#   value = data.github_ip_ranges.test.git
# }

# output repos {
#     value = data.github_repositories.ian-hancock.full_names
# }

# output userid {
#     value = data.github_user.ian-hancock.id
# }