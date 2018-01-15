# docker-ansible-starter

A simple setup to run ansible in docker for local development.

## Usage
```bash
# In project dir
docker-compose up -d
```

This will start two Docker containers. `ansible` has Ansible installed (Dockerfile) and `target` has `openssh-server` installed (Dockerfile-target). `target` also has a user `target` with password `target` and the root user has password `root` (it is recommended to disable root ssh in your Ansible playbook).  There is also an `inventory.txt` file that has `target` in group `local`.

You can create your Ansible project in the current directory. A simple example would be:
```yaml
---
# playbook.yml

- hosts: local
  tasks:
  	ping:

``` 

You could then `exec` into the `ansible` machine
```
docker-compose exec ansible bash
```

This will place you in the `/playbooks` directory which is mapped to your project directory. So you could then run:
```
ansible-playbook playbook.yml -i inventory.txt -u target -k
# prompt for password (target)
```
and see the results of Ansible's `ping` task.

## More info
The `docker-compose.yml` and `inventory.txt` files are just starting places. `docker-compose.yml` has ports 80 and 443 open as web develpoment is a common use case.
