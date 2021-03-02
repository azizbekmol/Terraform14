# Terraform14
#source image.json

{
    "builders": [{
        "type": "amazon-ebs",
        "region": "us-east-1",
        "source_ami_filter": {
            "filters": {
                "virtualization-type": "hvm",
                "name": "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*",
                "root-device-type": "ebs"
        },
            "owners": ["099720109477"],
            "most_recent": true
        },
        
        "instance_type": "t2.micro",
        "ssh_username": "ubuntu",
        "ami_name": "ubuntu-example {{timestamp}}"
        }
    ]
}
{
    "builders": [{
        "type": "amazon-ebs",
        "region": "us-east-1",
        "source_ami_filter": {
            "filters": {
                "virtualization-type": "hvm",
                "name": "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*",
                "root-device-type": "ebs"
        },
            "owners": ["099720109477"],
            "most_recent": true
        },
        
        "instance_type": "t2.micro",
        "ssh_username": "ubuntu",
        "ami_name": "ubuntu-example {{timestamp}}"
        }
    ]
}
{
    "builders": [{
        "type": "amazon-ebs",
        "region": "us-east-1",
        "source_ami_filter": {
            "filters": {
                "virtualization-type": "hvm",
                "name": "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*",
                "root-device-type": "ebs"
        },
            "owners": ["099720109477"],
            "most_recent": true
        },
        
        "instance_type": "t2.micro",
        "ssh_username": "ubuntu",
        "ami_name": "ubuntu-example {{timestamp}}"
        }
    ]
}