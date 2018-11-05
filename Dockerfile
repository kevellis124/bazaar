from ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /code
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . .
COPY ./docker-entrypoint.sh .
RUN chmod 755 /code/docker-entrypoint.sh

CMD ["/code/docker-entrypoint.sh"]