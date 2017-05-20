# Dockerfile for Sample Rails Application

FROM enakai00/fedora:21
MAINTAINER YURAK

RUN yum install -y make gcc gcc-c++ ruby-devel rubygem-rails rubygem-therubyracer libsqlite3x-devel
ADD create_app.sh /usr/local/bin/create_app.sh
RUN chmod u+x /usr/local/bin/create_app.sh && /usr/local/bin/create_app.sh
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh
CMD ["/usr/local/bin/init.sh"]

