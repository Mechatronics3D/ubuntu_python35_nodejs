# Copyright (c) 2012-2016 Codenvy, S.A.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
# Contributors:
# Codenvy, S.A. - initial API and implementation
# Modified by Behzad Samadi to add python3.6.2

FROM eclipse/stack-base:debian
    
RUN sudo apt-get update && \
    sudo apt-get -y install build-essential libkrb5-dev gcc make ruby-full rubygems debian-keyring python3.6.2 && \
    sudo gem install --no-rdoc --no-ri sass -v 3.4.22 && \
    sudo gem install --no-rdoc --no-ri compass && \
    sudo apt-get clean && \
    sudo apt-get -y autoremove && \
    sudo apt-get -y clean && \
    sudo rm -rf /var/lib/apt/lists/* 

RUN wget -qO- https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN sudo apt update && sudo apt -y install nodejs

EXPOSE 5000 8080
RUN sudo npm install --unsafe-perm -g gulp bower grunt grunt-cli yeoman-generator yo generator-angular generator-karma generator-webapp
LABEL che:server:8080:ref=vue che:server:8080:protocol=http che:server:5000:ref=flask che:server:5000:protocol=http
