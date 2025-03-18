#This script scans a Docker image using Trivy for vulnerabilities.
#!/bin/bash
set -e

if ! command -v trivy &> /dev/null; then
    echo "Installing Trivy..."
    curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh
fi

IMAGE_NAME="your-app-image:latest"

echo "Running Container Security Scan on $IMAGE_NAME..."
trivy image $IMAGE_NAME

echo "Container security scan completed!"
