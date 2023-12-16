How to use;

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
