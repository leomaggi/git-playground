# specify the base image
FROM centos:7

LABEL maintainer = "Awesome Leonard Ngwa"

# update our packages
RUN yum -y update && yum clean all

# install apache 
RUN yum install -y httpd

# copy the app inside the container 
COPY index.html /var/www/html

# Port on which the container should listen to 
EXPOSE 80

# Run httpd by doing systemctl start httpd
# hey when container starts please start apache
ENTRYPOINT ["/usr/sbin/httpd"]

# we dont what the conatiner to exit 
# run container in the background
CMD  ["-D", "FOREGROUND"]
