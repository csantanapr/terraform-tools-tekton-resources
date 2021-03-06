module "dev_tools_tekton" {
  source = "github.com/ibm-garage-cloud/terraform-tools-tekton.git"

  cluster_type             = module.dev_cluster.type_code
  cluster_config_file_path = module.dev_cluster.config_file_path
  cluster_ingress_hostname = module.dev_cluster.ingress_hostname
  tools_namespace          = module.dev_capture_state.namespace
}

module "dev_tools_tekton_resources" {
  source = "./module"

  cluster_type             = module.dev_cluster.type_code
  cluster_config_file_path = module.dev_cluster.config_file_path
  tekton_namespace         = module.dev_tools_tekton.namespace
  resource_namespace       = module.dev_capture_state.namespace
}
