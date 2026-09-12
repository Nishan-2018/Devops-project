# Step-by-Step Execution Plan: How to Implement & Deploy

Follow this step-by-step guide to implement, deploy, test, and showcase your Azure DevOps Portfolio Project.

---

## 📍 Phase 1: Local Prerequisites & Repository Setup

### Step 1: Open Project Location
Open your IDE (VS Code / Cursor / PyCharm) and set the active workspace folder to:
`/Users/nishan/.gemini/antigravity/scratch/azure-devops-platform`

### Step 2: Initialize Git Repository & Push to Remote
1. Create a new repository on **GitHub** or **Azure Repos** named `azure-devops-platform`.
2. Run the following commands in your terminal:
   ```bash
   cd /Users/nishan/.gemini/antigravity/scratch/azure-devops-platform
   git init
   git add .
   git commit -m "feat: initial enterprise azure devops platform architecture"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/azure-devops-platform.git
   git push -u origin main
   ```

---

## ☁️ Phase 2: Azure Setup & Remote Backend Creation

### Step 3: Azure CLI Authentication
Log in to your Azure account:
```bash
az login
az account show --output table
```

### Step 4: Create Azure Remote State Storage Account (For Terraform Backend)
Run this script to set up the remote storage account for Terraform state locking:
```bash
# Create Resource Group for Terraform State
az group create --name tfstate-rg --location eastus2

# Create Storage Account
az storage account create \
  --name cloudopstfstate001 \
  --resource-group tfstate-rg \
  --location eastus2 \
  --sku Standard_LRS

# Create Storage Container
az storage container create \
  --name tfstate \
  --account-name cloudopstfstate001
```

---

## 🏗️ Phase 3: Infrastructure Provisioning via Terraform

### Step 5: Test & Apply Infrastructure Locally
```bash
cd /Users/nishan/.gemini/antigravity/scratch/azure-devops-platform/terraform

# Initialize Terraform with Azure backend
terraform init

# Validate syntax & preview changes
terraform plan -out=tfplan

# Apply infrastructure creation (~8-10 minutes)
terraform apply tfplan
```

### Step 6: Verify Azure Resources Created
Check that the following resources exist in Azure Portal:
- Resource Group: `cloudops-rg-dev`
- AKS Cluster: `cloudops-aks-dev`
- ACR Registry: `cloudopsacrdev001...`
- Key Vault: `cloudops-kv-dev...`

---

## 🐳 Phase 4: Microservices Containerization & Helm Deployment

### Step 7: Connect `kubectl` to AKS Cluster
```bash
az aks get-credentials --resource-group cloudops-rg-dev --name cloudops-aks-dev --overwrite-existing
kubectl get nodes
```

### Step 8: Build Microservices & Push to Azure Container Registry (ACR)
```bash
cd /Users/nishan/.gemini/antigravity/scratch/azure-devops-platform

# ACR Login
az acr login --name cloudopsacrdev001

# Build & Push Frontend Microservice
docker build -t cloudopsacrdev001.azurecr.io/frontend-service:v1.0.0 app/frontend/
docker push cloudopsacrdev001.azurecr.io/frontend-service:v1.0.0

# Build & Push Order Microservice (Go Distroless)
docker build -t cloudopsacrdev001.azurecr.io/order-service:v1.0.0 app/order-service/
docker push cloudopsacrdev001.azurecr.io/order-service:v1.0.0

# Build & Push Payment Microservice (Python)
docker build -t cloudopsacrdev001.azurecr.io/payment-service:v1.0.0 app/payment-service/
docker push cloudopsacrdev001.azurecr.io/payment-service:v1.0.0
```

### Step 9: Deploy Services to AKS using Helm
```bash
helm upgrade --install microservices-platform k8s/helm/microservices-chart \
  --namespace default \
  --set frontend.image.tag=v1.0.0 \
  --set orderService.image.tag=v1.0.0 \
  --set paymentService.image.tag=v1.0.0

# Verify Pod Status
kubectl get pods -w
kubectl get svc
```

---

## ⚡ Phase 5: Azure DevOps Pipelines Automation

### Step 10: Configure Azure DevOps Organization & Service Connection
1. Open [Azure DevOps Portal](https://dev.azure.com/).
2. Create a Project named `azure-devops-platform`.
3. Go to **Project Settings** > **Service Connections** > **New Service Connection** > **Azure Resource Manager** > **Service Principal (automatic)**.
4. Name the connection: `azure-spn-service-connection`.

### Step 11: Create Azure DevOps Pipelines
1. Go to **Pipelines** > **New Pipeline** > Select your Git repository.
2. Link the 3 pipeline YAML files from `pipelines/`:
   - [azure-pipelines-iac.yml](file:///Users/nishan/.gemini/antigravity/scratch/azure-devops-platform/pipelines/azure-pipelines-iac.yml) (Infrastructure)
   - [azure-pipelines-ci.yml](file:///Users/nishan/.gemini/antigravity/scratch/azure-devops-platform/pipelines/azure-pipelines-ci.yml) (CI Build & Security Scans)
   - [azure-pipelines-cd.yml](file:///Users/nishan/.gemini/antigravity/scratch/azure-devops-platform/pipelines/azure-pipelines-cd.yml) (GitOps/Helm CD Deployment)
3. Run the pipelines to verify end-to-end automated execution!

---

## 🧹 Phase 6: Cost Control Cleanup

When you are done testing/demonstrating for the day, tear down all Azure resources in **one command**:

```bash
cd /Users/nishan/.gemini/antigravity/scratch/azure-devops-platform/terraform
terraform destroy -auto-approve
```
This stops all charges immediately.
