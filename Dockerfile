# FROM ruby:2.5.1
# RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
# RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# WORKDIR /myproject

# ADD Gemfile /myproject/Gemfile
# ADD Gemfile.lock /myproject/Gemfile.lock

# RUN gem install bundler -v 1.17.3
# RUN rm Gemfile.lock
# RUN bundle _1.17.3_ install

# ADD . /myproject
