# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
ANSIBLE_TMP_DIR = "/tmp/ansible"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 80, host: 28080

  config.vm.network "private_network", ip: "192.168.233.10"

  # config.vm.network "public_network"

  config.vm.synced_folder "./ansible", ANSIBLE_TMP_DIR, type: "rsync", owner: "vagrant", mount_options: ['dmode=777','fmode=755']

  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  config.vm.provision :shell do |sh|
    sh.path = "./ansible/setup.sh"
    sh.args = "#{ANSIBLE_TMP_DIR}"
  end
end
