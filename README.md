Static Website Hosting (Mini Project)
📌 Overview

This mini project demonstrates how to host a static website on AWS using Terraform, Amazon S3, and CloudFront. The website is stored in S3 and delivered globally through CloudFront with HTTPS enabled.

🏗️ Architecture

Internet → CloudFront → S3 (Static Website)

🚀 Features

Website

Responsive modern UI

Dark / Light theme toggle

Interactive elements & animations

Infrastructure

S3 static website hosting

CloudFront CDN with HTTPS

Public read-only access

Correct MIME types for web files

🛠️ Prerequisites

AWS CLI configured

Terraform v1.0+

AWS account with S3 & CloudFront permissions

📋 Deployment Steps
terraform init
terraform plan
terraform apply --auto-approve

After deployment, Terraform outputs:

website_url = "https://xxxx.cloudfront.net"

📊 Resources Created

S3 Bucket (Website Hosting)

S3 Bucket Policy (Public Read)

S3 Objects (HTML, CSS, JS)

CloudFront Distribution

🧹 Cleanup
terraform destroy --auto-approve

🎯 Learning Outcomes

S3 static website hosting

CloudFront CDN setup

Public access configuration

Terraform resource provisioning
