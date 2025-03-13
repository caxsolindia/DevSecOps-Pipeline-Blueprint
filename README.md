# DevSecOps-Pipeline-Blueprint
This repository documents the DevSecOps Pipeline Blueprint, outlining the security-integrated CI/CD workflows for Application and Infrastructure Pipelines.  

## Overview
This blueprint defines an end-to-end DevSecOps process that integrates security at every stage of software development and infrastructure deployment.

It covers:
- Application Pipeline – Secure application builds and deployments
- Infrastructure Pipeline – Secure Infrastructure-as-Code (IaC) practices
- Security Automation – Continuous security scanning and monitoring

## Architecture Diagram
![Infra-App-Pipeline-6](https://github.com/user-attachments/assets/720e65ee-08b4-40aa-bd49-18b524145206)

## Application Pipeline (CI/CD)

The Application Pipeline automates build, security, testing, and deployment workflows using AWS services.

🔹Workflow Steps:

 - Code Commit – Developers push code to AWS CodeCommit.

 - Build & Unit Test – Uses Maven, Gradle, and testing frameworks (JUnit, Pytest).

 - Code Coverage Analysis – Uses Jacoco, pytest-cov, OpenCover to ensure test quality.

 - Secrets Scanning – git-secrets scans for exposed credentials.

 - Static Code Analysis (SAST) & Dependency Scanning – Tools like Anchore, Snyk, OWASP Dependency Check ensure security.

 - Dynamic Code Analysis (DAST) – OWASP ZAP performs real-world attack simulations.

 - Runtime Security (RASP) – Falco monitors application behavior.

 - Manual Approval – A review step before deployment.

 - Deployment (AWS CodeDeploy) – Secure release with rolling updates or blue/green deployments.

 - Security Monitoring – AWS CloudWatch, Lambda scan analysis, and Security Hub.


## Infrastructure Pipeline (IaC Security)

The Infrastructure Pipeline ensures secure Infrastructure-as-Code (IaC) deployments.

🔹Workflow Steps:

 - Code Commit – Infrastructure as Code (Terraform) is stored in AWS CodeCommit.

 - Linting & Security Analysis

    -> TFLint for Terraform best practices.
  
    -> Checkov & Terrascan for security misconfigurations.
   
 - Cost Estimation (Infracost) – Generates reports on infrastructure costs.
   
 - Manual Approval – Required before deploying changes.
   
 - Deployment (AWS CodeBuild) – Secure provisioning of AWS resources.
   
 - Monitoring & Notifications
   
    -> AWS CloudWatch for infrastructure health.
   
    -> Slack Alerts via AWS Chatbot for pipeline status updates.
   
    -> AWS Security Hub for compliance monitoring.

## Folder Structure for Custom Scripts

```bash
📦 devsecops-pipeline
├── 📂 scripts
│   ├── trigger_pipeline.sh      # Triggers AWS CodePipeline
│   ├── security_scan.sh         # Runs SAST, DAST, and Secrets Scanning
│   ├── notify_slack.sh          # Sends pipeline status
│   ├── container_scan.sh        # Runs Trivy for Docker image scanning
│   └── terraform_check.sh       # Runs Terraform security checks

```

## Key Integrations

- AWS Services: CodePipeline, CodeBuild, CodeDeploy, CloudWatch, Security Hub

- Security Tools: git-secrets, Anchore, Snyk, OWASP ZAP, Falco

- IaC Security: TFLint, Checkov, Terrascan, Infracost

- Notifications: AWS SNS, AWS Chatbot (Slack)



