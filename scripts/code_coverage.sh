#This script runs JaCoCo (Java), pytest-cov (Python) and OpenCover (.NET).
#!/bin/bash
set -e

echo "Running Code Coverage Analysis..."

if [ -f "pom.xml" ]; then
    echo "Using JaCoCo for Java"
    mvn jacoco:report
elif [ -f "build.gradle" ]; then
    echo "Using JaCoCo for Gradle"
    gradle jacocoTestReport
elif [ -f "requirements.txt" ]; then
    echo "Using pytest-cov for Python"
    pytest --cov=. --cov-report=xml
elif [ -f "*.csproj" ]; then
    echo "Using OpenCover for .NET"
    OpenCover.Console.exe -target:"dotnet test" -output:coverage.xml
else
    echo "No known project found!"
    exit 1
fi

echo "Code Coverage Completed!"
