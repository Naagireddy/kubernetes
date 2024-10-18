### JENKINS INSTALL ON UBUNTU 18.04
* Create a jenkins user and make him passwordless authenication. For that edit the sshd_config file in 
```  
sudo vi /ect/ssh/sshd_config
service sshd restart
```
* Give him to sudo permissions for that add him to in "sudoers" file.
```
export VISUAL=vim; visudo
export VISUAL=nano; visudo
```
### Install the required softwares.
* install java 
* install maven
* install git 