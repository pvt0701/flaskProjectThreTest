# AWS ECS With Terraform

A complete guide of how to setup AWS ECS With Terraform from the flask.



Sets up the following AWS infrastructure:

- Networking:
    - VPC
    - Public and private subnets
    - Routing tables
    - Internet Gateway
    - Key Pairs
- Security Groups
- Load Balancers, Listeners, and Target Groups
- IAM Roles and Policies
- ECS:
    - Task Definition
    - Cluster
    - Service
- Launch Config and Auto Scaling Group
- RDS
- Health Checks and Logs
- CloudWatch


## Setup

Install Terraform

Sign up for an AWS account

Create .env file:

```sh
AWS_ACCESS_KEY_ID=" "
AWS_SECRET_ACCESS_KEY=" "
AWS_DEFAULT_REGION=" "
POSTGRES_USER=" "
POSTGRES_PW=" "
POSTGRES_HOST=" "
POSTGRES_DB=" "

```

Initiate the Terraform workspace:

```sh
cd terraform
terraform init
terraform workspace new production
```

Create the ECR repository:

```sh
terraform apply -target=aws_ecr_repository.default
```

Generate the app image and upload it:

```sh
ACCOUNT_ID=YOUR_ACCOUNT_ID \
REGION=us-west-2 \
REPOSITORY=YOUR_REPOSITORY \
ECR_URL=YOUR_URL \
TAG=v0.1.0 \
bash release.sh

```

Create the SSM Parameter variables:

```sh
resource "aws_ssm_parameter" "container_definitions__account_id" {
  name      = "/terraform/${terraform.workspace}/CONTAINER_DEFINITIONS__ACCOUNT_ID"
  overwrite = true
  type      = "String"
  value     = "..."
}

resource "aws_ssm_parameter" "db_instance__password" {
  name      = "/terraform/${terraform.workspace}/DB_INSTANCE__PASSWORD"
  overwrite = true
  type      = "SecureString"
  value     = "..."
}

resource "aws_ssm_parameter" "key_pair__public_key" {
  name      = "/terraform/${terraform.workspace}/KEY_PAIR__PUBLIC_KEY"
  overwrite = true
  type      = "SecureString"
  value     = "..."
}
```

Execute Terraform:

```sh
terraform apply
```
