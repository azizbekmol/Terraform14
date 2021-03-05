# Build RDS Instance
### Please copy paste below code
```
module "db" {
    source = "../"
    region = "us-east-1"

    subnet_ids = [
        "subnet-0b6500ba53e504996",
        "subnet-09c997962a48bfd64",
        "subnet-0b639959384bc5f39"
    ]

    identifier          = "dbname"
    allocated_storage   = 20
    storage_type        = "gp2"
    engine              = "mysql"
    engine_version      = "5.7"
    instance_class      = "db.t2.micro"
    username            = "foo"
    publicly_accessible = true


    db_access = [
        "0.0.0.0/0"
    ]
}
output region {
  value = module.db.region
}
output subnet_list {
  value = module.db.subnet_list
}
output db_access {
  value = module.db.db_access
}
output DB_NAME {
  value = module.db.DB_NAME
}

output endpoint {
  value = module.db.endpoint
}
```
### Note: Password will be created in SSM