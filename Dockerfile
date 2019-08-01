##############################################################################
FROM ruby:2.6.3-slim AS base
WORKDIR /application

RUN apt update && \
    apt -o APT::Install-Suggests=0 \
        -o APT::Install-Recommends=0 install -y \
        sqlite3 libpq5 curl git && \
    rm -f /var/cache/apt/archives/*.deb \
    /var/cache/apt/archives/partial/*.deb \
    /var/cache/apt/*.bin

##############################################################################
FROM ruby:2.6.3 AS build
WORKDIR /application

ENV BUNDLE_JOBS=4 \
    RAILS_ENV=production \
    RAILS_SERVE_STATIC_FILES=yes

ADD Gemfile* /application/

RUN bundle install --frozen

ADD . /application

RUN bundle exec rake assets:precompile

RUN rm -rf tmp/cache app/assets vendor/assets lib/assets spec && \
    find /usr/local/bundle -name '*.c' -o -name '*.o' -delete

##############################################################################
FROM base

ENV BUNDLE_JOBS=4 \
    RAILS_ENV=production \
    GEM_PATH=/usr/local/bundle \
    DATABASEYML_SKIP=yes \
    RAILS_SERVE_STATIC_FILES=yes

CMD bin/rails s -b 0.0.0.0

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /application /application
