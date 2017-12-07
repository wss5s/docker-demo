FROM ubuntu:17.10

USER root
RUN apt-get update
RUN apt-get install -y  ruby-full
RUN apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs yarn
RUN gem install bundler -v 1.16.0

WORKDIR /tmp
COPY Gemfile /tmp/
COPY Gemfile.lock /tmp/
RUN bundle install

RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY . /opt/app

EXPOSE 3000

#CMD ["/bin/bash"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

# docker build -t demo
# docker run -itP demo
# docker ps 

#$ docker ps
#CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                     NAMES
#cce25838a27d        demo                "bundle exec rails..."   7 seconds ago       Up 6 seconds        0.0.0.0:32768->3000/tcp   eloquent_babbage

# in broswer go to: localhost:32768 to connect rails app.

