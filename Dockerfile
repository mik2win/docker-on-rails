FROM ruby:3.2.2
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
    apt update &&\
    apt install -y libpq-dev freetds-dev nano nodejs yarn npm &&\
    apt clean

RUN mkdir /app
WORKDIR /app
COPY . .

RUN bundle install

RUN chmod 775 docker-entrypoint.sh
ENTRYPOINT ["bin/bash", "/app/docker-entrypoint.sh" ]
ENV RAILS_ENV production
EXPOSE 3000