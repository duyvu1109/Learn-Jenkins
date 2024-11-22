#!/bin/sh

# Install Java
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y
java -version


# Install Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y

# Install Git
sudo apt install git -y

# Custom configuration
mkdir -p /jenkins/casc_configs/

cat << EOF > /jenkins/casc_configs/jenkins.yaml
jenkins:
  systemMessage: "Jenkins configured automatically by Jenkins Configuration as Code plugin\n\n"
  clouds:
    - docker:
        name: "docker"
        dockerApi:
          dockerHost:
            uri: "unix:///var/run/docker.sock"

  slaveAgentPort: 80

tool:
  git:
    installations:
      - name: git
        home: /usr/bin/git

EOF



# Install Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins


# Start services
CASC_JENKINS_CONFIG="/jenkins/casc_configs/jenkins.yaml"

sudo systemctl enable jenkins
sudo systemctl start jenkins
