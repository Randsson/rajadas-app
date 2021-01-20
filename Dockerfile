FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /rajadas-app
WORKDIR /rajadas-app
COPY Gemfile /rajadas-app/Gemfile
COPY Gemfile.lock /rajadas-app/Gemfile.lock
COPY docker-compose.yml /rajadas-app/docker-compose.yml
RUN bundle install
ADD . /rajadas-app
CMD bash -c "rm -f tmp/pids/server.pid && rails s -p 3000 -b '0.0.0.0'"