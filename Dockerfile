FROM ruby:2.5.1
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           
RUN mkdir /app_name 
ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler -v 2.1.4
RUN bundle install
ADD . $APP_ROOT