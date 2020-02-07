FROM jenkins/jenkins:2.204.1-jdk11

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY seedjob.groovy /usr/local/seedjob.groovy
COPY jenkins.yaml /usr/local/jenkins.yaml
ENV CASC_JENKINS_CONFIG /usr/local/jenkins.yaml
