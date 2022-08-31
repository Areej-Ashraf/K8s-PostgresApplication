FROM ruby:2.7.1-alpine
RUN apk --update add build-base nodejs tzdata postgresql-dev postgresql-client libxslt-dev libxml2-dev imagemagick

ENV INSTALL_PATH /app_name
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile.lock ./

RUN gem install bundler
RUN bundle install
COPY . ./

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
