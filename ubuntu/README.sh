# README

## Configure a new ubuntu box

### install necessary prerequisites

```bash
sudo apt install openssh-server
```

Install brew and related tools

```bash
bash brew-tools.sh
```

And then copy the ssh key to enable passwordless ssh.

```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub gary@starkiller.local
```

Use [ansible-playground](https://github.com/mingliangguo/ansible-playground) to configure the base image:

```bash
ansible-playbook -i sandbox.ini configure-vm.yml -e host_name=starkiller.local -e user_name=gary
```


