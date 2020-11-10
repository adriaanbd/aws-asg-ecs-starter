# AWS with ASG, ECS and Network Layout

AWS infrastructure-as-code (IaC) starter for deploying a Microservice on ECS with Auto Scaling Group in a multi-availability-zone network layout with public and private subnets.

## Requirements

1. AWS Account
2. AWS CLI
3. Terraform CLI

## Getting Started

1. Look at what is being deployed:

```
$ terraform plan
```   

2. Deploy

```
$ terraform apply -auto-approve
```

3. Destroy

```
$ terraform destroy -auto-approve
```
