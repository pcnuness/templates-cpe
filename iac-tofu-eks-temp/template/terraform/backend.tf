terraform {
  backend "s3" {}
}

https://github.com/${{ parameters.repoUrl | parseRepoUrl | pick('owner') }}/${{ values.projectName }}

/*
# EXEC LOCAL
terraform {
  backend "s3" {
    bucket         = "381491977476-backend-iac-opentofu"
    key            = "pcnuness/containers-blog/eks-adr-kubernetes/cluster-kubernetes/terraform.tfstate"
    region         = "us-east-1"
  }
}
*/