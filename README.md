# Nerd-DE IaaC Repo

Hi, this repo contains the IaaC in Terraform for the PoC project that is currently under development. As time moves forward new assets and refactors are expected. This is a live repo and everyone in the team is encouraged to push changes for the latest sessions.

I added a *gcp-project-setup.sh* file that contains the shell commands to setup the service account that will in the future be used to deploy the architecture using GitHub Actions. 

### Services details

**DataProc**: By default, the script creates a single node cluster, you might want to change this if you want to try larger workloads by setting the *DATAPROC_WORKERS* variable to an integer larger than zero. It also installs Jupyter.