# README
## OMS API

## Development Setup
- Ruby version 2.7.1
- Rails version 6.0.4
### System Level Dependencies:
- PostgreSQL 14.1
### Project Level Dependencies
- bundle install
### Setting up the Database
```
rails db:create
```
```
rails db:migrate
```
```
rails db:seed
```
### Start the Rails Server
```
rails server
```
### Running Tests
```
bundle exec rspec
```
# DEVOPS Project Structure

- Docker files: Dockerfiles and related configuration files are located in the `docker` folder.
- Terraform files: Infrastructure provisioning using Terraform is defined in the `terraform` folder.

## Project Structure

- Docker files: Dockerfiles and related configuration files are located in the `docker` folder.
- Terraform files: Infrastructure provisioning using Terraform is defined in the `terraform` folder.

## Building the Docker Image

To build the Docker image for the application, follow these steps:

1. Open a terminal and navigate to the root directory of the project.
2. Run the following command to build the Docker image:

   ```bash
   docker build . --file ./docker/Dockerfile
   ```


## Using the Docker Compose up

To run the application using Docker Compose, make sure you have Docker Compose installed on your system. If you don't have it installed, you can install it from here.

Follow these steps to run the application:

1) Open a terminal and navigate to the `root` directory of the project.

2) Run the following command to start the application using Docker Compose:

   ```bash
    cd docker
    docker-compose up
   ``` 



## Terraform
### Prerequisites

Before you begin, make sure you have the following prerequisites:

2. **AWS Credentials**: If your Terraform configuration targets AWS resources, ensure that you have valid AWS credentials configured, either by setting environment variables or using AWS CLI profiles.

### Usage

To provision and manage the infrastructure using Terraform, follow these steps:

1. Open a terminal and navigate to this `terraform` directory.

2. The remote state is managed on AWS S3 bucket. 

3. Initialize Terraform by running:

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## CI with GitHub Actions

- The GitHub Actions workflows are defined in `.github/workflows/rubyonrails-CI.yml` directory.


## CD with Jenkinsfile
- CD is managed using a `Jenkinsfile`, which defines the deployment pipeline in Jenkins.


