# ansible in docker

This is a inofficial docker image for [ansible](https://github.com/ansible/ansible) based on alpine linux, because
an official image is not available.

This image is available on [docker hub](https://hub.docker.com/r/felixzimmermann/ansible).

# Contents

Besides an full ansible installation, this image contains openssh-client to connect to remote hosts.

# Tags

The follwoing tags are available:

-   `latest` - latest version of ansible
-   `x.y.z` - ansible version x.y.z, e.g. 2.16.0

# Usage

To connect safely to remote hosts, the ssh key should be mounted into the container. The ssh key should be mounted to `/root/.ssh/*`. Further the ansible inventory file and the playbook directory should be mounted into the container. The inventory file should be mounted to `/etc/ansible/hosts` and the playbook directory to `/ansible/playbooks/*`.

## Example

An generic example for the usage of this image is shown below.

```bash
user@host:~$ docker run --rm -it \
-v ${HOME}/.ssh/:/root/.ssh/ \
-v <path/to/inventory>:/etc/ansible/hosts \
-v <path/to/playbooks/folder>:/ansible/playbooks/ \
ansible <tool> <playbook>
```

An more specific example for the usage is shown with the ansible-playbook command below.

```bash
user@host:~$ docker run --rm -it \
-v ${HOME}/.ssh/:/root/.ssh/ \
-v ${HOME}/ansible-playbooks/inventory.yaml:/etc/ansible/hosts \
-v ${HOME}/ansible-playbooks/playbooks/:/ansible/playbooks/ \
ansible ansible-playbook ping.yaml
```

## Aliases

To make the usage of this image more convenient, you can create for each tool an alias in your `.bashrc` or `.zshrc` file.

```bash
alias ansible-playbook='docker run --rm -it -v ${HOME}/.ssh/:/root/.ssh/ -v ${HOME}/ansible-playbooks/inventory.yaml:/etc/ansible/hosts -v ${HOME}/ansible-playbooks/playbooks/:/ansible/playbooks/ ansible ansible-playbook'
```

The alias above can be used like the original ansible-playbook command.

```bash
user@host:~$ ansible-playbook ping.yaml
```
