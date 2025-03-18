#This script scans Terraform code for misconfigurations using TFLint, Checkov and Terrascan.
#!/bin/bash
set -e

echo "Running Terraform Security Checks..."

if ! command -v tflint &> /dev/null; then
    echo "Installing TFLint..."
    curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install.sh | bash
fi

if ! command -v checkov &> /dev/null; then
    echo "Installing Checkov..."
    pip install checkov
fi

if ! command -v terrascan &> /dev/null; then
    echo "Installing Terrascan..."
    curl -L https://raw.githubusercontent.com/accurics/terrascan/master/scripts/install.sh | bash
fi

echo "Running TFLint..."
tflint --init
tflint

echo "Running Checkov..."
checkov -d .

# #If you want to ignore certain Checkov checks
# echo "Running Checkov with ignored checks..."
# checkov -d . --skip-check CKV_AWS_20,CKV_AWS_21

echo "Running Terrascan..."
terrascan scan -d .

echo "Terraform security checks completed!"
