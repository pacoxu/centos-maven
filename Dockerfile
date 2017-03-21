FROM daocloud.io/centos:7.3.1611

RUN yum update -y && yum install wget -y


RUN cd /opt/ &&  wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz" && tar xzf jdk-8u121-linux-x64.tar.gz && cd /opt/jdk1.8.0_121/ && alternatives --install /usr/bin/java java /opt/jdk1.8.0_121/bin/java 2 && echo '1' | alternatives --config java && java -version && rm -f /opt/jdk-8u121-linux-x64.tar.gz
ENV JAVA_HOME=/opt/jdk1.8.0_121/

RUN cd /opt/ &&  wget http://mirror.olnevhost.net/pub/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz && tar xvf apache-maven-3.0.5-bin.tar.gz && mv apache-maven-3.0.5  /usr/local/apache-maven &&  rm -f /opt/apache-maven-3.0.5-bin.tar.gz
ENV M2_HOME=/usr/local/apache-maven
ENV M2=$M2_HOME/bin  
ENV PATH=$M2:$PATH

CMD ["sleep", "infinity" ]

