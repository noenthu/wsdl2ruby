FROM centos:centos6

#RUN /bin/bash -l -c "export http_proxy=http://10.10.5.18:8080"

ENV http_proxy "http://10.10.5.18:8080"
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

ENV https_proxy "http://10.10.5.18:8080"; http_proxy "http://10.10.5.18:8080"
RUN curl -sSL https://get.rvm.io | bash -s stable

ENV PATH /usr/local/rvm/bin:/usr/local/sbin/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 1.8.7"
RUN /bin/bash -l -c "gem install soap4r --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install bundler"

#COPY wsdls/. /wsdls

#RUN cd /wsdls

VOLUME ["/wsdls"]

ENTRYPOINT ["/bin/bash", "-l", "-c", "/wsdls/wsdl2ruby.sh"]

#EXPOSE 8080
#CMD ["node", "/src/index.js"]

