# This trigger initiates builds when there are changes in the specified branch (main)
trigger:
  branch: 'main'

# Cloud Build steps for building and deploying to Cloud Run
steps:
  # Step 1: Build Docker image using Dockerfile at the root of the directory
  - name: 'gcr.io/cloud-builders/docker'
    args: ['build', '-t', 'gcr.io/$PROJECT_ID/my-app:latest', '.']

  # Step 2: Push the Docker image to Google Container Registry
  - name: 'gcr.io/cloud-builders/docker'
    args: ['push', 'gcr.io/$PROJECT_ID/my-app:latest']

  # Step 3: Deploy the image to Cloud Run
  - name: 'gcr.io/google.com/cloudsdktool/cloud-sdk'
    entrypoint: 'gcloud'
    args: [
      'run', 'deploy', 'my-app', # App name
      '--image', 'gcr.io/$PROJECT_ID/my-app:latest', # Image to deploy
      '--region', 'us-central1',  # Specify your region
      '--platform', 'managed',
      '--allow-unauthenticated'
    ]

# Specify images to be pushed
images:
  - 'gcr.io/$PROJECT_ID/my-app:latest'

# Optional: Notifications can be enabled here by specifying your email
# substitutions:
#   _EMAIL: 'your_email@example.com'
