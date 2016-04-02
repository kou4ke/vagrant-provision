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
  #  wget http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
  #  sudo rpm --import RPM-GPG-KEY-EPEL-6
  #  wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
  #  sudo rpm -ivh epel-release-6-8.noarch.rpm
  #   sudo yum install -y ansible
  # for centos/7
  sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
  sudo yum -y update
  sudo yum install -y ansible
fi
#  
# cp /vagrant/${ANSIBLE_HOSTS} ${TEMP_HOSTS}
# chmod -x ${TEMP_HOSTS}
# echo "Running Ansible"
# bash -c "ansible-playbook /vagrant/${ANSIBLE_PLAYBOOK} --inventory-file=${TEMP_HOSTS} --connection=local"
# rm ${TEMP_HOSTS}
