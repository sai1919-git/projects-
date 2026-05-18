### Automated AWS Infrastructure Provisioning using Terraform (Multi-Environment IaC)

This project provisions AWS infrastructure using Terraform with a modular architecture and support for multiple environments (`dev`, `staging`, `prod`).

---

##### Project Architecture

This Terraform project creates:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance

---

##### Project Structure

```bash
terraform-aws-infra/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── backend.tf
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── security-groups/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── envs/
    ├── dev.tfvars
    ├── staging.tfvars
    └── prod.tfvars
```
#### Create S3 Backend Bucket
```bash
aws s3 mb s3://sai1919-terraform-state-bucket --region ap-south-1

```
#### Create DynamoDB Lock Table
```bash

aws dynamodb create-table \
    --table-name terraform-lock-table \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region ap-south-1

```
##### Terraform commands

```bash
terraform init 
terraform validate
Terraform Plan
terraform plan -var-file="envs/dev.tfvars"
Terraform Apply
terraform apply -var-file="envs/dev.tfvars"

```

 