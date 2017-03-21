FROM daocloud.io/centos:7.3.1611

RUN yum update -y && yum install wget -y

RUN cd /opt/ &&  wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz" && tar xzf jdk-8u121-linux-x64.tar.gz && cd /opt/jdk1.8.0_121/ && alternatives --install /usr/bin/java java /opt/jdk1.8.0_121/bin/java 2 && echo '1' | alternatives --config java && java -version


