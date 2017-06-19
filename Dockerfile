FROM centos:centos6

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

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

#ENTRYPOINT ["wsdl2ruby.rb", "--wsdl", "JCIMobilitySafetyPositionWS", "--type", "client", "--classdef" "JCIMobilitySafetyPositionWS", "--module_path", "JCIMobilitySafetyPositionWS", "--force"]

#ENTRYPOINT ["/wsdls/test.sh"]

#CMD ["/usr/local/rvm/gems/ruby-1.8.7-head/gems/soap4r-1.5.8/bin/wsdl2ruby.rb", "--wsdl", "JCIMobilitySafetyPositionWS", "--type", "client", "--classdef" "JCIMobilitySafetyPositionWS", "--module_path", "JCIMobilitySafetyPositionWS", "--force"]

#RUN cd /wsdls; /bin/bash -l -c "wsdl2ruby.rb --wsdl JCIMobilitySafetyPositionWS.WSDL --type client --classdef JCIMobilitySafetyPositionWS --module_path JCIMobilitySafetyPositionWS --force" 

#RUN gem install soap4r --no-ri --no-rdoc

#RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
#RUN yum -y install nodejs

#RUN yum -y install gcc-c++ make
#RUN yum -y groupinstall 'Development tools'

#RUN cd /src; npm install

#EXPOSE 8080
#CMD ["node", "/src/index.js"]

