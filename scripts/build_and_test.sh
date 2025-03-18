#This script builds the application and runs unit tests.
#!/bin/bash
set -e

echo "Building the application..."

if [ -f "pom.xml" ]; then
    echo "Using Maven"
    mvn clean package
elif [ -f "build.gradle" ]; then
    echo "Using Gradle"
    gradle build
else
    echo "No build tool found!"
    exit 1
fi

echo "Build completed!"

echo "Running Unit Tests..."
if [ -f "pom.xml" ]; then
    mvn test
elif [ -f "build.gradle" ]; then
    gradle test
fi

echo "Unit Tests Passed!"
