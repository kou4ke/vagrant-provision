ANSIBLE_TMP_DIR="/tmp/ansible"
ANSIBLE_PLAYBOOK="development.yml"
ANSIBLE_HOSTS="hosts"
 
cp -a /home/vagrant/sync/ansible ${ANSIBLE_TMP_DIR}
chmod -x ${ANSIBLE_TMP_DIR}

if [ ! -f $ANSIBLE_TMP_DIR/$ANSIBLE_PLAYBOOK ]; then
 echo "[${0}]Cannot find Ansible playbook"
 exit 1
fi
 
if [ ! -f $ANSIBLE_TMP_DIR/$ANSIBLE_HOSTS ]; then
 echo "[${0}]Cannot find Ansible hosts"
 exit 2
fi
 
if ! [ `which ansible` ]; then
  # for centos/7
  sudo yum -y install epel-release
  sudo yum -y update
  sudo yum -y install ansible
fi
  
cd ${ANSIBLE_TMP_DIR}
echo "Running Ansible"
bash -c "ansible-playbook ${ANSIBLE_PLAYBOOK} -i ${ANSIBLE_HOSTS} --connection=local"

rm -rf ${ANSIBLE_TMP_DIR}
