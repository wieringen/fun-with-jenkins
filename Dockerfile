FROM jenkins:1.609.3
USER root

# Remove existing upstream config
RUN rm -fr /usr/share/jenkins/ref/*

# Disable default plugins
RUN mkdir /usr/share/jenkins/ref/plugins
RUN touch /usr/share/jenkins/ref/plugins/ant.jpi.disabled && \
    touch /usr/share/jenkins/ref/plugins/antisamy-markup-formatter.jpi.disabled && \
    touch /usr/share/jenkins/ref/plugins/cvs.jpi.disabled && \
    touch /usr/share/jenkins/ref/plugins/external-monitor-job.jpi.disabled && \
    touch /usr/share/jenkins/ref/plugins/ldap.jpi.disabled && \
    touch /usr/share/jenkins/ref/plugins/pam-auth.jpi.disabled && \
    touch /usr/share/jenkins/ref/plugins/ssh-slaves.jpi.disabled && \
    touch /usr/share/jenkins/ref/plugins/subversion.jpi.disabled && \
    touch /usr/share/jenkins/ref/plugins/translation.jpi.disabled && \
    touch /usr/share/jenkins/ref/plugins/windows-slaves.jpi.disabled

COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
