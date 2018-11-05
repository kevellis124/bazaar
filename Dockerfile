from ruby:2.5.1
RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs
WORKDIR /usr/src/app
COPY Gemfile* /usr/src/app/
RUN bundle install

COPY . /usr/src/app/



COPY ./docker-entrypoint.sh .

RUN chmod 755 ./docker-entrypoint.sh

CMD ["./docker-entrypoint.sh"]