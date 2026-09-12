# Azure Cloud Cost Estimate & Optimization Guide

## 📊 1. Monthly Cost Breakdown (If left running 24/7)

If you leave the entire infrastructure running continuously for 30 days without destroying it, here is the approximate cost breakdown:

| Azure Resource | SKU / Specifications | Estimated Monthly Cost (24/7) |
| :--- | :--- | :--- |
| **AKS Cluster Control Plane** | Free Tier Management | **$0.00** |
| **AKS System Node Pool** | 2x `Standard_D2s_v3` (2 vCPU, 8GB) | ~$70.00 / month |
| **AKS User Spot Node Pool** | 2x `Standard_D2s_v3` (Spot ~80% discount) | ~$15.00 / month |
| **Azure Container Registry (ACR)** | Basic SKU | ~$5.00 / month |
| **Azure Key Vault** | Standard SKU | ~$0.50 / month |
| **Virtual Network & NSGs** | VNet & Subnets | **$0.00** (Free) |
| **Azure Log Analytics** | Free tier (up to 5GB/month ingestion) | **$0.00** |
| **Total (Running 24/7 for a full month)** | | **~$90.50 / month** |

---

## 💡 2. How to run this project for under $5 (or $0)

You **do NOT** need to keep the infrastructure running 24/7! 

### Strategy A: Spin-Up & Tear-Down Strategy (Recommended — Costs ~$2 to $5 Total)
1. When you want to practice, run your pipeline, or demonstrate the project:
   ```bash
   cd terraform
   terraform apply -auto-approve
   ```
2. Run your tests, capture screenshots/logs for your resume/portfolio, and record demos.
3. If you keep the cluster active for **3 hours**, it costs approximately **~$0.30**.
4. When finished for the day, tear down all billable resources in one command:
   ```bash
   terraform destroy -auto-approve
   ```
👉 **Total cost for 10 full testing & demo sessions: ~$3.00 to $5.00.**

---

### Strategy B: Azure Free Account / Credits (Costs $0 Out of Pocket)
- If you use an Azure Free Account (which includes **$200 in free credits** for 30 days), this entire project will cost **$0 out of pocket**.

---

## 🛠️ 3. Built-In FinOps Features in Your Codebase

Your project codebase already includes automated cost governance tools:

1. **Infracost Integration ([azure-pipelines-iac.yml](file:///Users/nishan/.gemini/antigravity/scratch/azure-devops-platform/pipelines/azure-pipelines-iac.yml#L49-L55))**: 
   Every pull request automatically calculates exact hourly/monthly cost differences before you run `terraform apply`.
2. **AKS Spot Instances ([aks/main.tf](file:///Users/nishan/.gemini/antigravity/scratch/azure-devops-platform/terraform/modules/aks/main.tf#L47-L73))**: 
   User node pools utilize Azure Spot VMs, saving up to 80% on compute pricing.
3. **Log Analytics Retention Cap**:
   Data retention is capped at 30 days within Azure's free ingestion tier (5GB/mo).
