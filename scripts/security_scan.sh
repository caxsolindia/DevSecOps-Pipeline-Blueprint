# This Script Does:
# Checks and installs git-secrets (for secrets scanning) and sonar-scanner (for code analysis).
# Runs git-secrets to detect sensitive credentials in the repository.
# Runs sonar-scanner for deep static analysis of security, maintainability, and code quality issues.
# Runs OWASP ZAP (DAST) to identify web application vulnerabilities.
#!/bin/bash
set -e  # Exit script on any error

# Install necessary tools if not installed
if ! command -v git-secrets &> /dev/null; then
    echo "Installing git-secrets..."
    git clone https://github.com/awslabs/git-secrets.git
    cd git-secrets && make install && cd ..
fi

if ! command -v sonar-scanner &> /dev/null; then
    echo "Installing SonarQube Scanner..."
    wget -qO- "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip" | bsdtar -xf- -C /usr/local/
    export PATH="/usr/local/sonar-scanner-5.0.1.3006-linux/bin:$PATH"
fi

echo "Running Secrets Scanning..."
git-secrets --scan

echo "Running Static Analysis with SonarQube..."
sonar-scanner \
  -Dsonar.projectKey=your_project_key \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://your-sonarqube-server:9000 \
  -Dsonar.login=your_sonarqube_token

echo "Running Dynamic Application Security Testing (DAST) with OWASP ZAP..."
docker run -v $(pwd):/zap/wrk -t owasp/zap2docker-stable zap-baseline.py -t http://your-app-url

echo "Security scans completed!"

