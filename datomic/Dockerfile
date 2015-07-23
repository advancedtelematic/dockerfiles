# Datomic Free v0.9.5153
#
# It's public image to run datomic database on docker container.

FROM java

#-- INSTALL PREREQURIEMENTS
#update package manager
RUN apt-get -y update

# install curl
RUN apt-get install -y curl
# install unzip
RUN apt-get install -y unzip

#initialise global variables
ENV DATOMIC_VERSION 0.9.5153
ENV DATOMIC_HOME /home/docker/datomic
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV PATH $JAVA_HOME:/bin:/usr/bin:$PATH

#-- SETUP DATOMIC
# create required folders
RUN mkdir ~/temp
RUN mkdir ~/datomic
RUN mkdir ~/datomic_configs

# download source
RUN echo Downloading version ${DATOMIC_VERSION}
RUN curl --location\
 --url "https://my.datomic.com/downloads/free/${DATOMIC_VERSION}"\
 --output ~/temp/datomic.zip

# unzip datomic
RUN unzip -qu ~/temp/datomic.zip -d ~/temp

#move unzipped files into own folder and remove temp folder
RUN cp -r ~/temp/datomic-free-${DATOMIC_VERSION}/* ~/datomic
RUN rm -r ~/temp

#-- RUN DATOMIC
# copy default transactor into datomic root
RUN cp ~/datomic/config/samples/free-transactor-template.properties ~/datomic/free-transactor.properties

# Clean out apt-cache
RUN apt-get clean

# modify url in transactor file
RUN sed "s/host=localhost/host=0.0.0.0/" -i ~/datomic/free-transactor.properties
COPY start-up.sh /tmp/start-up.sh
RUN cp /tmp/start-up.sh /bin/start-up.sh
RUN chmod +x /bin/start-up.sh


# -- execute free transactor with updated settings
CMD ["/bin/start-up.sh"]
EXPOSE 4334 4335
