from ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y libqt5webkit5-dev qt5-default xvfb
WORKDIR /code/
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY ./docker-entrypoint.sh .

RUN chmod 755 docker-entrypoint.sh

CMD ["/code/docker-entrypoint.sh"]