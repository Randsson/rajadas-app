FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /eureca
WORKDIR /eureca
COPY rajadas-app/Gemfile /eureca/Gemfile
COPY rajadas-app/Gemfile.lock /eureca/Gemfile.lock
RUN bundle install
COPY rajadas-app /eureca
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]