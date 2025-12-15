# Terraform Project: AWS Lambda Serverless Architecture Deployment using Terraform

### Disclaimer © Ebubechukwu Azozie
- All README content, source files, documentation, and screenshot images in this GitHub repository are original work created by me, **Ebubechukwu Azozie**. Unauthorized copying or reuse without proper attribution is not permitted.

## Resources used 
- AWS CLI Toolkit
- Terraform
- Package Manager - Chocolatey (for Windows - I use windows) or Homebrew (if you're using macOS)
- Visual Studio
- GitHub


Outline/Steps used to deploy:
- Write a lambda code (lambda_function.py)
- Package the code into a Zip file
- Define Terraform resources (IAM Role + Lambda)
- Run Terraform init, plan, and apply

The official Terraform documentation for Lambda can be found here: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function


### Step 1 - Write a lambda code (lambda_function.py)

lambda_function.py code written can be found in this repository source codes

Created other terraform files named
- provider.tf
- main.tf
- variables.tf
All can be coudn in this repository source files

### Step 2 - Package the code into a Zip file

I injected this code below into my terrraform 'main.tf' file to do the packaging

```
# Package the Lambda function code
# This section packages the lambda file and generate a zip with it
data "archive_file" "zip" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lambda_function.zip"
}

```


<img width="769" height="394" alt="image" src="https://github.com/user-attachments/assets/122e35c4-6a52-4e1d-9304-a334501b9948" />

Lambda_function.zip - Zip file created automatically

### Step 3 - Define Terraform resources (IAM Role + Lambda)
Already defined in the source code 'variables.tf', 'main.tf'


### Step 4 - Run Terraform Init, Plan, and Apply
 
Terraform init

<img width="975" height="379" alt="image" src="https://github.com/user-attachments/assets/e5f504ab-c16d-49dc-9926-c689c975e1ef" />

 
Terraform init - successful



Terraform plan

<img width="975" height="702" alt="image" src="https://github.com/user-attachments/assets/502829f0-e664-414a-9d23-a578e023a475" />


<img width="975" height="721" alt="image" src="https://github.com/user-attachments/assets/c7446b89-67f1-4433-b95e-60310c54fd26" />

 

<img width="975" height="523" alt="image" src="https://github.com/user-attachments/assets/ce03aacf-2778-4b77-850b-32ee1e6b91c3" />

 
Terraform plan - Successful 
-	Creating the lambda function 
-	Attaching an IAM role to it

Terraform apply

<img width="975" height="342" alt="image" src="https://github.com/user-attachments/assets/06128423-86c9-481b-8994-a0bed1bf172f" />

Terraform apply - Successful


### Checking the console to verify the Lambda function and IAM role created  


<img width="975" height="90" alt="image" src="https://github.com/user-attachments/assets/fa3dc7e7-46b4-484a-ab70-3a80edc92f87" />

 
Lambda function created successfully by terraform

<img width="975" height="442" alt="image" src="https://github.com/user-attachments/assets/35b558cc-220e-46e9-b499-2875cf057e3a" />


More details 

<img width="975" height="254" alt="image" src="https://github.com/user-attachments/assets/b2598706-70ab-420b-ad81-54a6c67766f6" />


IAM Role for Lambda that was created by Terraform







