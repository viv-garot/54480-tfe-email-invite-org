# TFE installation
cp /vagrant/config/replicated.conf /etc/replicated.conf
curl -o install.sh https://install.terraform.io/ptfe/stable
bash ./install.sh \
    no-proxy \
    private-address=192.168.10.10 \
    public-address=192.168.10.10
usermod -aG docker vagrant
