# tfe-vagrant
Install TFE on Demo version with Self Sign Certificate - vagrant -VirtualBox


## Pre-requirements

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) 
* [Terraform cli](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* [Vagrant](https://www.vagrantup.com/docs/installation)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)


## How to use this repo

- Clone
- Run
- Cleanup

---

### Clone the repo

```
git clone https://github.com/viv-garot/tfe-vagrant
```

### Change directory

```
cd tfe-vagrant
```

### Run

* Copy your license file to config/license.rli (for TF Support Engineer, check 1Password Support Engineering Vault, hashicorp-internall---support.rli)

```
cp /path/to/your/license config/license.rli
```


* Bring up the VM:

```
vagrant up
```

_sample_:

```
vagrant up
Bringing machine 'tfe' up with 'virtualbox' provider...
==> tfe: Importing base box 'vivien/bionic64'...
==> tfe: Matching MAC address for NAT networking...
==> tfe: Checking if box 'vivien/bionic64' version '21.07.06' is up to date...
==> tfe: Setting the name of the VM: tfe-vagrant_tfe_1630413845473_94028
==> tfe: Clearing any previously set network interfaces...
==> tfe: Preparing network interfaces based on configuration...
    tfe: Adapter 1: nat
    tfe: Adapter 2: hostonly
==> tfe: Forwarding ports...
    tfe: 22 (guest) => 2222 (host) (adapter 1)
==> tfe: Running 'pre-boot' VM customizations...
==> tfe: Booting VM...
==> tfe: Waiting for machine to boot. This may take a few minutes...
    tfe: SSH address: 127.0.0.1:2222
    tfe: SSH username: vagrant
    tfe: SSH auth method: private key
    tfe:
    tfe: Vagrant insecure key detected. Vagrant will automatically replace
    tfe: this with a newly generated keypair for better security.
    tfe:
    tfe: Inserting generated public key within guest...
    tfe: Removing insecure key from the guest if it's present...
    tfe: Key inserted! Disconnecting and reconnecting using new SSH key...
==> tfe: Machine booted and ready!
==> tfe: Checking for guest additions in VM...
==> tfe: Setting hostname...
==> tfe: Configuring and enabling network interfaces...
==> tfe: Mounting shared folders...
    tfe: /vagrant => /Users/viviengarot/Desktop/VisualCode/skillsmap/TFE/tfe-vagrant
==> tfe: Running provisioner: shell...
    tfe: Running: /var/folders/cl/pb51l2dx2050qg0vpbwg_tv40000gq/T/vagrant-shell20210831-12887-15g0qe1.sh
    tfe:   % Total    % Received % Xferd
    tfe: Average Speed   Time    Time
    tfe:      Time  Current
    tfe:                                  Dl
    tfe: oad  Upload
    tfe:  Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:02 --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:03 --:--:--     0
 34  146k   34 51541    0     0  12084      0  0:00:12  0:00:04  0:00:08 12081
    tfe: 1
    tfe: 0
    tfe: 0
    tfe:
    
    
 [ ... ]
 
    tfe: dfe99bc54bd2:
    tfe: Pull complete
    tfe: 932531148e85:
    tfe: Pull complete
    tfe: Digest: sha256:33b33b28c915cff56ddcb426847ee192eb0f7873fc44b2cd9ffa0b2a684f8e31
    tfe: Status: Downloaded newer image for replicated/replicated-operator:stable-2.53.0
    tfe: docker.io/replicated/replicated-operator:stable-2.53.0
    tfe: Tagging replicated-operator image
    tfe: Stopping replicated-operator service
    tfe: Installing replicated-operator service
    tfe: Starting replicated-operator service
    tfe: Created symlink /etc/systemd/system/docker.service.wants/replicated-operator.service → /etc/systemd/system/replicated-operator.service.
    tfe:
    tfe: Operator installation successful
    tfe: To continue the installation, visit the following URL in your browser:
    tfe:
    tfe:   http://192.168.10.10:8800
     
```

* TFE components need some time for first initialization.  You may poll the _/_health_check_ endpoint until a _200_ is returned by the application, indicating that it is fully started:

```
while ! curl -ksfS --connect-timeout 5 https://192.168.10.10/_health_check; do sleep 5 ; done
```

_sample_:

```
while ! curl -ksfS --connect-timeout 5 https://192.168.10.10/_health_check; do sleep 5 ; done
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (7) Failed to connect to 192.168.10.10 port 443: Connection refused
curl: (22) The requested URL returned error: 502 Bad Gateway
curl: (22) The requested URL returned error: 502 Bad Gateway
curl: (22) The requested URL returned error: 502 Bad Gateway
curl: (22) The requested URL returned error: 502 Bad Gateway
curl: (22) The requested URL returned error: 502 Bad Gateway
curl: (22) The requested URL returned error: 502 Bad Gateway
curl: (22) The requested URL returned error: 502 Bad Gateway
curl: (22) The requested URL returned error: 502 Bad Gateway
{"postgres":"UP","redis":"UP","vault":"UP"}
```

* Once TFE is fully started, visit [192.168.10.10:8800](http:192.168.10.10:8800) in your browser

![image](https://user-images.githubusercontent.com/85481359/131506177-d3e391d9-716e-4da3-bb11-99c4f53b7c65.png)

* Enter *Password!* to unlock the console

![image](https://user-images.githubusercontent.com/85481359/131506368-c9dbf73d-9307-47e2-9ad4-5f5edc227b18.png)

* Enjoy

![image](https://user-images.githubusercontent.com/85481359/131506458-8ae2bff0-d97e-47a8-95c5-d2ea4dd8e003.png)


### Cleanup

```
vagrant destroy
```

_sample_:

```
vagrant destroy
    tfe: Are you sure you want to destroy the 'tfe' VM? [y/N] y
==> tfe: Forcing shutdown of VM...
==> tfe: Destroying VM and associated drives...
```
