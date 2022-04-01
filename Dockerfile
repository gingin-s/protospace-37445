FROM ruby:2.6.5

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn 

RUN mkdir /protospace-37445
WORKDIR /protospace-37445

COPY Gemfile /protospace-37445/Gemfile
COPY Gemfile.lock /protospace-37445/Gemfile.lock
COPY package.json /protospace-37445/package.json
COPY yarn.lock /protospace-37445/yarn.lock

RUN gem install bundler 

RUN bundle config set --local path 'vendor/bundle' && \
    bundle install

COPY . /protospace-37445