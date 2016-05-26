FROM debian:8.4
MAINTAINER Thil Bandara <thil@foresightcreations.com>

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN apt-get update -q && \
    apt-get -y install locales && \
    locale-gen en_US en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get -y install curl && \
    curl -o /tmp/erlang.deb http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/erlang.deb && \
    rm -rf /tmp/erlang.deb

RUN apt-get -y install apt-transport-https build-essential && \
    apt-get update -qq && \
    apt-get -y install \
    erlang \
    erlang-base erlang-dev erlang-tools erlang-syntax-tools \
    erlang-crypto erlang-public-key erlang-ssl erlang-ssh erlang-asn1 erlang-inets \
    erlang-inets erlang-mnesia erlang-odbc \
    erlang-parsetools erlang-eunit \
    elixir=1.2.4-1 \
    erlang-eunit \
    erlang-dev

RUN apt-get -y install git

RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force

WORKDIR /app

ENV MIX_ENV prod

COPY mix.* /app/

RUN mix do deps.get, deps.compile

COPY . /app/

CMD ["mix", "run", "--no-halt"]
