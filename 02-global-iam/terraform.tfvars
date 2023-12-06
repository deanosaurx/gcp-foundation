
# This is an example of global IAM configuration. Use this to give users, groups, and service accounts access to folders,
# projects, etc.

folders_iam = {
  # Bindings for the kyndean-dev folder
  "dev" = {
    bindings = {
        "roles/browser" = [
        "user:marko@markodevops.com",
      ]
    }
    conditional_bindings = []
  }
}

#org_bindings = {
#  "roles/billing.viewer" = [
#    "user:operator-one@markodevops.com",
#  ]
#  "roles/resourcemanager.folderViewer" = [
#    "user:operator-one@markodevops.com",
#  ]
#}
#
#folders_iam = {
#  # Bindings for the kyndean-dev folder
#  "dev" = {
#    bindings = {
#      "roles/browser" = [
#        "user:operator-one@markodevops.com",
#      ]
#    }
#    conditional_bindings = []
#  }
#  # binding for the kyndean-stg folder
#  "stg" = {
#    bindings = {
#      "roles/browser" = [
#        "user:operator-one@markodevops.com",
#      ]
#    }
#    conditional_bindings = []
#  }
#  # Bindings to the kyndean-prd folder
#  "prd" = {
#    bindings = {
#      "roles/browser" = [
#        "user:operator-one@markodevops.com",
#      ]
#    }
#    conditional_bindings = []
#  }
#  # Bindings for the kyndean-shared folder
#  "shared" = {
#    bindings = {
#      "roles/browser" = [
#        "user:operator-one@markodevops.com",
#      ]
#    }
#    conditional_bindings = []
#  }
#}
#
#audit_bindings = {
#  "roles/viewer" = [
#    "user:operator-one@markodevops.com",
#  ]
#}
#
#billing_project_bindings = {
#  "roles/viewer" = [
#    "user:operator-one@markodevops.com",
#  ]
#}
