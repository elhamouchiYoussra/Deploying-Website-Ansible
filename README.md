# Deploying Websites using Ansible Technology 
## Run the playbook with the following command


first command get the access to the lists of the playbooks 
```bash
#cd playbooks
```
seconde command run the deploying static website script which call the roles that we need along with the target hosts that we need 
```bash
#ansible-playbook -i ../inventories/mednourconsulting_gcp/hosts deploy_siteweb_static.yml 
```


