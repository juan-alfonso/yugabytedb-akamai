# yugabytedb-akamai
Deployment of YugabyteDB cluster in 3 Akamai Connected Cloud regions

### Attention!!!
The deployment doesn't enable encryption in transit and authentication.\
The instances are not protected with firewalls.\
Don't use it for production.

## Creation of the YugabyteDB cluster
Step to create the database cluster:
  1. Configure the variables in the file `config.tfvars`
  2. Execute `terraform init`
  3. Execute `terraform plan -var-file='config.tfvars'`
  4. Execute `terraform apply -var-file='config.tfvars'`

The varibales availables for configuration in the `config.tfvars` are the following:
  - `linode_token` -> https://www.linode.com/docs/products/tools/api/guides/manage-api-tokens/
  - `instance_region1` -> Akamai datacenter location
  - `instance_region2` -> Akamai datacenter location
  - `instance_region3` -> Akamai datacenter location
  - `instance_password` -> Password of root user for the instances
  - `instance_number` -> Number of nodes per region +1
  - `instance_type` -> Akamai compute instance type
