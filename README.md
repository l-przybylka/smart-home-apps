# Welcome to Infrastructure as Code for smart home applications 👋

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000)

> The goal of the project was to build IaC on AWS using Terraform that will allow to deploy 3 smart home monitoring apps for heating, lights and status of the previous two. To achieve this goal I've provisioned a VPC, pub subs, route table etc. data base dynamodb, auto scaling, load balancer

## Install

```sh
terraform init
```

## Usage

Step 1: After logging in to AWS in the CLI, initialise terraform in the terraform directory

```

~$ cd terraform
~/terraform$ terraform init

```

Step 2: Run terraform apply using the .tfvars file (use example.tfvars for reference)

```

~/terraform$ terraform apply -var-file=example.tfvars

```

Step 3: SSH into your servers and install your microservers
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
