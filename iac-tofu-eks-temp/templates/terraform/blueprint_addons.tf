{#- Template para configuração de addons EKS -#}
module "eks_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "~> 1.21"

  cluster_name      = local.cluster_name
  cluster_version   = local.cluster_version
  cluster_endpoint  = local.cluster_endpoint
  oidc_provider_arn = local.oidc_provider_arn

  eks_addons = {
{%- if values.enabledCoreDns %}
    # ==================================================================
    # FOUNDATION NETWORKING - AWS ADDONS NEEDED FOR EKS OPERATIONS
    # ==================================================================
    coredns = {
      addon_version        = local.aws_eks.cluster_addon_versions.coredns
      configuration_values = jsonencode(yamldecode(file("${path.root}/values/coredns.yaml")))
    }
{%- endif %}
{%- if values.enabledKubeProxy %}
    kube-proxy = {
      addon_version        = local.aws_eks.cluster_addon_versions.kube_proxy
      configuration_values = jsonencode(yamldecode(file("${path.root}/values/kube-proxy.yaml")))
    }
{%- endif %}
{%- if values.enabledPodIdentityAgent %}
    # ==================================================================
    # FOUNDATION SECURITY - AWS ADDONS NEEDED FOR EKS OPERATIONS
    # ==================================================================
    eks-pod-identity-agent = {
      addon_version        = local.aws_eks.cluster_addon_versions.eks_pod_identity_agent
      configuration_values = jsonencode(yamldecode(file("${path.root}/values/eks-pod-identity-agent.yaml")))
    }
{%- endif %}
{%- if values.enabledEbsCsiDriver %}
    # ==================================================================
    # FOUNDATION STORAGE - AWS ADDONS NEEDED FOR EKS OPERATIONS
    # ==================================================================
    aws-ebs-csi-driver = {
      addon_version            = local.aws_eks.cluster_addon_versions.aws_ebs_csi_driver
      service_account_role_arn = module.ebs_csi_driver_irsa.iam_role_arn
      configuration_values     = jsonencode(yamldecode(file("${path.root}/values/aws-ebs-csi-driver.yaml")))
    }
{%- endif %}
  }

  depends_on = [module.eks]
}