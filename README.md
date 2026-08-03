# Bootcamp Capstone

This repository contains our team's **TEKsystems Platform Engineer / Mainframe Bootcamp Capstone** project. The goal of this project is to modernize enterprise operations by creating a **cross-platform automation platform** that manages both Linux and IBM z/OS environments through a single Git-driven workflow.

Our solution combines **Terraform**, **Ansible**, **GitHub Actions**, **AWS**, and the **IBM z/OS Core Collection** to automate infrastructure provisioning, mainframe operations, CI/CD, and observability using modern DevOps practices.

---

# Background

Enterprise environments often consist of both modern Linux systems and traditional IBM z/OS mainframes. While Linux infrastructure has widely adopted Infrastructure as Code and CI/CD, many mainframe operations are still performed manually through ISPF, RACF administration, and JCL submission.

The objective of this project is to bridge those environments into a unified automation platform where infrastructure, configuration, operational tasks, and monitoring are all managed through code.

---

# What It Does

This project automates both Linux and IBM z/OS operations using Ansible playbooks and GitHub Actions.

On the **z/OS** side, the platform can:

- Create RACF groups and users
- Provision developer libraries
- Manage datasets
- Submit JCL jobs
- Retrieve JES output
- Verify successful execution through automated playbooks

On the **Linux** side, the platform demonstrates Infrastructure as Code concepts through Terraform and Ansible while integrating the monitoring stack used for observability.

Every change is validated through GitHub Actions before deployment, providing a repeatable and auditable workflow from source control to execution.

---

# Architecture

```text
                        GitHub Repository
                               │
                      Pull Request / Push
                               │
                    GitHub Actions CI/CD
                               │
         ┌─────────────────────┴─────────────────────┐
         │                                           │
         ▼                                           ▼
   Terraform (AWS)                          Ansible Playbooks
         │                                           │
         ▼                                           ▼
 Linux Infrastructure                  IBM z/OS Core Collection
         │                                           │
         │                             ├── RACF Automation
         │                             ├── Dataset Management
         │                             ├── Library Provisioning
         │                             ├── JCL Submission
         │                             └── JES Output Retrieval
         │
         ▼
 Prometheus Pushgateway
         │
         ▼
    Prometheus
         │
         ▼
      Grafana
```

---

# Repository Structure

```text
mf-ansible/
├── .github/
│   └── workflows/
│       ├── lint.yml
│       └── run-ansible-mainframe.yml
│
├── ansible/
│   ├── group_vars/
│   │   └── all.yml
│   ├── jcl/
│   │   ├── hello_world.jcl
│   │   ├── racf_groups_users.jcl
│   │   └── sql_query.jcl
│   ├── .gitignore
│   ├── ansible.cfg
│   ├── cics_list_programs.yml
│   ├── cics_metrics.prom
│   ├── cics_report.yml
│   ├── create_dev_test_libraries.yml
│   ├── create_racf_group_and_users.yml
│   ├── csv.j2
│   ├── demo_library_failure.yml
│   ├── id_rsa
│   ├── inventory.yml
│   ├── master-playbook.yml
│   ├── racf_vars.yml
│   ├── run_jcl.yml
│   └── verify_end_to_end.yml
│
├── .ansible-lint
├── .gitignore
├── Dockerfile
├── Grafana-Example-Queries.md
└── README.md
```

---

# Technology Stack

- Ansible
- IBM z/OS Core Collection
- Terraform
- AWS
- GitHub Actions
- Prometheus
- Grafana
- Pushgateway
- Docker
- Linux
- IBM z/OS

---

# CI/CD Workflow

The GitHub Actions pipeline automatically performs:

- Code validation
- YAML validation
- ansible-lint
- Playbook execution
- Infrastructure deployment
- End-to-end verification
- Metrics collection for observability

This ensures every change is tested and executed consistently before reaching the target environment.

---

# Observability

To provide visibility into automation runs, the project integrates a monitoring stack consisting of:

- Prometheus
- Pushgateway
- Grafana

Metrics collected include:

- Pipeline execution status
- Playbook success and failure
- Automation runtime
- z/OS job execution
- Dataset provisioning status
- RACF provisioning events

These metrics are visualized through Grafana dashboards to provide real-time operational insight into both Linux and z/OS environments.

---

# Project Objectives

This capstone demonstrates:

- Infrastructure as Code
- Configuration Management
- Cross-platform automation
- Mainframe modernization
- CI/CD automation
- Infrastructure observability
- Secure automation practices
- Enterprise DevOps workflows

---

# Team Members

- Andrew Cook
- John DeLuce
- Jeremy Griffith
- Kamal Kharel