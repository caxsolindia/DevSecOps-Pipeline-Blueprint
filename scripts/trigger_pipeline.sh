#This script triggers the AWS CodePipeline execution for both Application and Infrastructure Pipelines
#!/bin/bash
set -e

APP_PIPELINE_NAME="AppPipeline"
INFRA_PIPELINE_NAME="InfraPipeline"

echo "Triggering Application Pipeline: $APP_PIPELINE_NAME"
aws codepipeline start-pipeline-execution --name $APP_PIPELINE_NAME

echo "Triggering Infrastructure Pipeline: $INFRA_PIPELINE_NAME"
aws codepipeline start-pipeline-execution --name $INFRA_PIPELINE_NAME

echo "Pipelines triggered successfully!"
