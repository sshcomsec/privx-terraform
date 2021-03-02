# PrivX on GCP 
This project simplifies PrivX on-boarding experience with deployment automation using Infrastructure as a Code (terraform).


## Description:
This repo contain terraform code to spin 1 Compute Instance on GCP for PrivX evaluation purposes.

* Postgresql Database : Local on same server

* Redis Cache  : Local on same server

* PrivX Server :  Centos8 AMI used for this VM and PrivX installation and configuration are being done as post build steps.

* ssh_user : Username `centos` can be used for ssh to virtual machine

## Pre-requisites : Install/Configure Google Cloud SDK and Terraform and update variables

1. Install [Git](https://git-scm.com/downloads)
1. Install [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) and Run `gcloud init` to initialize the SDK.
1. Install [Terraform](https://www.terraform.io/).


#### Mandatory variables to be updated (create terraform.tfvars file and populate value for below listed variables)
```
# GCP project id
project-id = "my-project"

# GCP region
region = "europe-west2"

# GCP zone
zone = "europe-west2-b"

#Public key to setup password less authentication for centos user on target Virutal machines
ssh_pub_key_file = "~/.ssh/id_rsa.pub"

# Private key path for key data specified above, Update private key path
ssh_private_key_file = "~/.ssh/id_rsa"
```

**Note:** private_key file should be created outside git repo as these files contain confidential data (private_key).

#### Optional variables: Default value for optional variable can be changed in variable.tf file (check variables.tf for all variables)
```
# Machine type for Privx (default = e2-medium)
machine_typeprivx = "e2-medium"

# Privx superuser name
privx_superuser = "admin"
```

**Note:** RANDOM password for database and privx_superuser will be generated and included in output.

## Deployment
1. Run `terraform init`
1. Run `terraform plan`
1. If plan looks good, run `terraform apply`

In the final step, please obtain a [license code](https://info.ssh.com/privx-free-access-management-software) to activate your environment.

## Next Steps
* [Getting Started with PrivX](https://privx.docs.ssh.com/docs)