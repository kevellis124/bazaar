from ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get update -qq && apt-get install chromium
RUN wget -q "https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip" -O /tmp/chromedriver.zip \
    && unzip /tmp/chromedriver.zip -d /usr/bin/ \
    && rm /tmp/chromedriver.zip

RUN ln -s /usr/bin/chromium-browser \
    && chmod 777 /usr/bin/chromium-browser
WORKDIR /code/
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY ./docker-entrypoint.sh .

RUN chmod 755 docker-entrypoint.sh

CMD ["/code/docker-entrypoint.sh"]