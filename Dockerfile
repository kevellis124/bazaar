from ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install
RUN apt-get update && apt-get install -y nodejs
RUN npm install yarn -g

WORKDIR /code/
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY ./docker-entrypoint.sh .

RUN chmod 755 docker-entrypoint.sh

COPY . .

CMD ["/code/docker-entrypoint.sh"]