ANSIBLE_TMP_DIR="$1"
ANSIBLE_PLAYBOOK="site.yml"
ANSIBLE_HOSTS="hosts"
 
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
  sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
  sudo yum -y update
  sudo yum install -y ansible
fi
  
cd ${ANSIBLE_TMP_DIR}
chmod -x ${ANSIBLE_TMP_DIR}
echo "Running Ansible"
bash -c "ansible-playbook ${ANSIBLE_PLAYBOOK} -i ${ANSIBLE_HOSTS} --connection=local"
