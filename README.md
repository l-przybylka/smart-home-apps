# Welcome to Infrastructure as Code for smart home applications 👋

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000)

> The goal of the project was to build IaC on AWS using Terraform which will allow to deployment 3 smart home monitoring apps for heating, lights and status of the previous two. To achieve this goal I've provisioned a VPC, pub subs, route table etc. data base dynamodb, auto scaling, load balancer
> What your application does,
> Why you used the technologies you used,
> Some of the challenges you faced and features you hope to implement in the future.

## Install

[Follow the Terraform installation steps for your system](https://developer.hashicorp.com/terraform/install)

## Usage

### Step 1: After logging in to AWS in the CLI, initialise Terraform in it's directory

```
~$ cd terraform
~/terraform$ terraform init
```

### Step 2: Update the terraform.tfvars file

> You must add your IP address and Access Key generated in AWS to be able to use the project. Here you can also customise the project specifications
```diff

# Sets the name of the VPC in AWS
vpc_name        = "home-management-project"
# Sets the CIDR block of the VPC
cidr            = "10.0.0.0/20"
# CIDR blocks for public and private subnets
public_subnets  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
# Availability zones where subnets will be deployed
azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
# Type of the EC2 instance to be provisioned
instance_type   = "t2.micro"
# Your details IP and the access key
access_key      = "YOUR_ACCESS_KEY"
ip_for_ssh_sg   = "YOUR_IP"
# Names of the services to deploy - these are used to name the resources correctly
services        = ["lights", "heating", "status"]
# Auto-scaling properties: minimum instances, desirable instances and max instances
min_instances   = 1
des_instances   = 2
max_instances   = 5

```

Step 3: Run terraform apply to create the infrastructure on AWS

```
~/terraform$ terraform apply
```

Step 4: SSH into your servers and install your microservers
<br>
<br>
a) Set-up node, npm and pm2 on each of the servers using the command below
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash &&
. ~/.nvm/nvm.sh &&
nvm install --lts &&
npm install pm2@latest -g
```
<br>
b) Clone and install the services
<br>
<br>
c) Use the following commands in your ec2 to make sure the autoscaling servers will run the application on start-up

```
ec2-server-ssh$ pm2 start <your application>
ec2-server-ssh$ pm2 startup
ec2-server-ssh$ pm2 save
```
```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```

## Modules
> The project is divided into the following modules:
### Networking
### Security
### App servers
### Database
### Load balancing
### Auto scaling
## Author

👤 **Lukasz Przybylka**

- LinkedIn: [@lukasz-przybylka\/](https://linkedin.com/in/lukasz-przybylka/)
