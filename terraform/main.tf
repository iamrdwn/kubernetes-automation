module "prod_cluster" {
    source = "./cluster"
    env_name = "prod"
    cluster_name = "k8scluster"
    instance_type = "standard_b2als_v2"
}

module "dev_cluster" {
    
    source = "./cluster"
    env_name = "dev"
    cluster_name = "k8scluster"
    instance_type = "standard_b2als_v2"

}