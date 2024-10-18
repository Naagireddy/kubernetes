### JENKINS INSTALL ON UBUNTU 18.04
 * PRERQUSITES
   * JAVA
   * GIT 
   * MAVEN
 * java home and maven home paths are must be set.
 * we can export java home but this is not permnetly so for this we should add the java home and maven home
  in .bashrc and restart terminal or take new terminal  
  ### create jenkins user
   * sudo -i
   * adduser jenkins
   * make jenkins user passwd less in /etc/sshd/sshd_config and (service sshd restart)
   * su jenkins
   * sudo usermod -aG root jenkins
   * or add jenins user in /etc/sudoers
   * export VISUAL=vim; visudo
   * export VISUAL=nano; visudo
   ```
   jenkins ALL=(ALL:ALL)    NOPASSWD:ALL
   wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
   sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
   ```
* sudo vi /etc/bash.bashrc
* add java home
* install java
* install maven
* instal jenkins
* add the repositories which are search in google
```
sudo apt-get update
sudo apt-get install openjdk -y
sudo apt-get install jenkins -y
vi .bashrc // and ser java home
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
 export PATH=$PATH:$JAVA_HOME/bin
```