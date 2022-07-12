PROJECT_NAME=""
SA_NAME="github-actions-sa"

gcloud auth login

gcloud config set project ${PROJECT_NAME}

gcloud services enable resourcesettings.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable iamcredentials.googleapis.com
gcloud services enable dataproc.googleapis.com
gcloud services enable composer.googleapis.com 

gcloud iam service-accounts create "${SA_NAME}" \
    --description="This service account allows us to invoke cloud services using github" \
    --display-name="GitHub Actions Service Account"

gcloud projects add-iam-policy-binding "${SA_NAME}" \
    --member="serviceAccount:${SA_NAME}@${PROJECT_NAME}.iam.gserviceaccount.com" \
    --role="roles/editor"

gcloud iam service-accounts keys create "${SA_NAME}-keys.json" \
    --iam-account="${SA_NAME}@${PROJECT_NAME}.iam.gserviceaccount.com"

