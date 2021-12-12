include "root" {
  path = find_in_parent_folders()
}

# get values from depended resource outputs
dependency "iam_role" {
  config_path = "../iam_role"
  mock_outputs = {
    iam_role_name = "iam-role-name"
  }
}

inputs = {
  iam_role_name = dependency.iam_role.outputs.iam_role_name
}
