# COOKBOOK FOR CREATING TOMCAT SERVER ON LINUX MACHINES

## AUTHOR:     AVINITA MOHANTY
## DATE:       5 MARCH 2017

## PURPOSE
This cookbook will do the following:
-   Update Package Installer
-   Install Java 1.8
    *   java version "1.8.0_121"
    *   Java(TM) SE Runtime Environment (build 1.8.0_121-b13)
-   Install Tomcat

### PLATFORMS SUPPORTED

*   Debian / Ubuntu derivatives
*   RHEL and derivatives
*   Fedora
*   openSUSE / SUSE Linux Enterprises

### TASK 1:     INSTALLING AND CONFIGURING JAVA

*   Retrieve jdk and jre from Oracle site.
*   Install java and set alternatives to respective versions for java and javac.
*   Export JAVA_HOME to /etc/environment

### TASK 2:     INSTALLING AND CONFIGURING TOMCAT

*   Create a user tomcat and group tomcat
*   Download Tomcat from http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.tar.gz
*   Extract the package to /opt/tomcat folder
*   Create a process file inside /etc/init.d to facilitate system level commands to start/stop tomcat.

### End Result : Render a welcome page from Tomcat when launched form browser.
