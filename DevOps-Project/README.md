
![Screenshot from 2024-10-15 23-48-03](https://github.com/user-attachments/assets/edbd0919-c52e-4851-97f3-79211c90047a)


# Infrastructure Automation and Kubernetes Deployment

## Overview
This project automates the provisioning of AWS infrastructure, Kubernetes cluster setup, CI/CD pipeline configuration, and application deployment using Terraform, Ansible, Jenkins, Docker, Kubernetes, Helm, Prometheus, and Grafana.

### Key Technologies
- **Terraform**: Infrastructure as Code (IaC) for AWS EC2 instances.
- **Ansible**: Automates Kubernetes cluster configuration.
- **Jenkins**: CI/CD pipeline for automating application deployment.
- **Docker**: Containerization of the application.
- **Kubernetes**: Orchestration of Docker containers.
- **Helm**: Package manager for Kubernetes manifests.
- **Prometheus & Grafana**: Monitoring and visualization.

---

## Table of Contents
1. [Setup AWS Infrastructure with Terraform]
2. [Configure Kubernetes Cluster with Ansible]
3. [CI/CD Pipeline with Jenkins]
4. [Application Containerization with Docker]
5. [Kubernetes Deployment]
6. [Helm Deployment]

---

### Setup AWS Infrastructure with Terraform
- Set up AWS credentials using `aws_access_key` and `aws_secret_key`.
- Write a Terraform configuration file (`main.tf`) to provision 3 EC2 instances with security groups, VPC, SSH key pairs, and ensure communication between instances.
- Create `outputs.tf` to retrieve public IPs of the instances.
- Run `terraform init` and `terraform apply`.

### Configure Kubernetes Cluster with Ansible
- Create an Ansible inventory file based on the IPs from Terraform.
- Write a playbook to install Docker, Kubernetes, and configure a multi-master high-availability cluster.
- Automate the joining of worker nodes to the Kubernetes cluster.

### CI/CD Pipeline with Jenkins
- Install Jenkins on a VM or Docker container.
- Create a Jenkins pipeline triggered on a pull request to the test branch.
- Jenkins pipeline stages: Clone repo, run unit tests, build and push Docker image to a container registry.

### Application Containerization with Docker
- Write a `Dockerfile` for the application.
- Integrate Dockerfile into Jenkins pipeline for automated builds.
- Test the Docker image locally.

### Kubernetes Deployment
- Write Kubernetes YAML files (deployment, services, etc.) to deploy the Dockerized app.
- Manually deploy the application using `kubectl`.

### Helm Deployment
- Write a Helm chart to package Kubernetes manifests.

