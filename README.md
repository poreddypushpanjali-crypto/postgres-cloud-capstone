# PostgreSQL Cloud Operations Platform

A production-style PostgreSQL platform demonstrating advanced SQL, database performance tuning, Linux automation, Kubernetes deployment, and AWS infrastructure provisioning with Terraform.

## Architecture

Application/SQL workload → PostgreSQL StatefulSet → Persistent Storage
                         ↓
                    Kubernetes Service
                         ↓
                 AWS EKS / VPC
                         ↓
                    Terraform

## Technologies
- PostgreSQL 18
- SQL: CTEs, window functions, views, materialized views, JSONB, functions, triggers, transactions
- Query optimization with EXPLAIN ANALYZE
- Docker Compose
- Linux Bash
- Kubernetes
- Terraform
- AWS EKS/VPC/IAM

## Quick local run

```bash
docker compose up -d
```

Connect:

```bash
psql -h localhost -p 5432 -U postgres -d retaildb
```

Password: `postgres`

Run the advanced SQL:

```bash
psql -h localhost -U postgres -d retaildb -f postgres/advanced_queries.sql
```

## Kubernetes

Build/start the PostgreSQL deployment:

```bash
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/postgres-config.yaml
kubectl apply -f kubernetes/postgres-secret.yaml
kubectl apply -f kubernetes/postgres-storage.yaml
kubectl apply -f kubernetes/postgres-statefulset.yaml
kubectl apply -f kubernetes/postgres-service.yaml
```

Check:

```bash
kubectl get pods -n postgres-platform
kubectl get svc -n postgres-platform
```

## AWS / Terraform

Configure AWS credentials first.

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

The Terraform configuration creates a VPC and EKS cluster suitable for deploying the Kubernetes manifests.

Destroy when finished to avoid unnecessary AWS charges:

```bash
terraform destroy
```

## Performance Engineering

The project includes examples of:
- composite indexes
- partial indexes
- JSONB indexing
- table partitioning
- materialized views
- EXPLAIN ANALYZE
- query rewrites

The goal is to compare execution plans before and after optimization.

## Backup

```bash
chmod +x scripts/*.sh
./scripts/backup.sh
```

Restore:

```bash
./scripts/restore.sh backups/retaildb_backup.sql
```

## Project outcome

This project demonstrates practical PostgreSQL administration and development skills together with cloud infrastructure and container orchestration.
