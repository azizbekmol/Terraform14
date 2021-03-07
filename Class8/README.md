# Terraform14
##  eks.tfvars 
region          = "us-east-1"
cluster_name    = "my_cluster"
cluster_version = "1.18"
instance_type   = "m4.large"
asg_max_size    = 5
asg_min_size    = 1

vpc_id = "vpc-0c0b7daf288212d56"
subnets = [
  "subnet-0b6500ba53e504996",
  "subnet-09c997962a48bfd64",
  "subnet-0b639959384bc5f39"
]

tags = {
    Name = "Cluster"
    Enviroment = "Dev"
    Team = "DevOps"
}