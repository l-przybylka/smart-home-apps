# Welcome to Infrastructure as Code for smart home applications 👋

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000)

> The goal of the project was to build IaC on AWS using Terraform that will allow to deploy 3 smart home monitoring apps for heating, lights and status of the previous two. To achieve this goal I've provisioned a VPC, pub subs, route table etc. data base dynamodb, auto scaling, load balancer
> What your application does,
> Why you used the technologies you used,
> Some of the challenges you faced and features you hope to implement in the future.
> What your application does,
> Why you used the technologies you used,
> Some of the challenges you faced and features you hope to implement in the future.

## Install

[Follow Terraform installation steps for your system](https://developer.hashicorp.com/terraform/install)

## Usage

### Step 1: After logging in to AWS in the CLI, initialise terraform in the terraform directory

```
~$ cd terraform
~/terraform$ terraform init
```

### Step 2: Update the terraform.tfvars

> You have to add your IP address and Access Key generated in AWS. Here you can also customise the project specifications

```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```

```diff
# Sets the name of the VPC in AWS
vpc_name        = "home-management-project"
# Sets the CIDR block of the VPC
cidr            = "10.0.0.0/20"
# cidr blocks for public and private subnets
public_subnets  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
# availability zones where subnets will be deployed
azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
# type of the EC2 instance to be provisioned
instance_type   = "t2.micro"
# your details IP and the access key
access_key      = "YOUR_ACCESS_KEY"
ip_for_ssh_sg   = "YOUR_IP"
# names of the services to deploy
services        = ["lights", "heating", "status"]
# auto scaling
min_instances   = 1
des_instances   = 2
max_instances   = 5

```

Step 3: Run terraform apply using the .tfvars file (use example.tfvars for reference)

```
~/terraform$ terraform apply -var-file=example.tfvars
```

Step 4: SSH into your servers and install your microservers
<br>
Hint: use the following commands in your ec2 to make sure the autoscaling servers will run the application on start up

```
ec2-server-ssh$ pm2 start <your application>
ec2-server-ssh$ pm2 startup
ec2-server-ssh$ pm2 save
```

## Author

👤 **Lukasz Przybylka**

- LinkedIn: [@lukasz-przybylka\/](https://linkedin.com/in/lukasz-przybylka/)

## Show your support

Give a ⭐️ if this project helped you!

---

_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
