# RbSlackbot

**TODO: Add description**

## Installation

Ensure you have docker-machine, docker-compose etc setup

Run
`make build` -> This should setup elixir environemnt in a docker container

'make console' -> This should enable you to console into the iex enviornment after build.  To exit iex you will need to do `control + c`


If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add rb_slackbot to your list of dependencies in `mix.exs`:

        def deps do
          [{:rb_slackbot, "~> 0.0.1"}]
        end

  2. Ensure rb_slackbot is started before your application:

        def application do
          [applications: [:rb_slackbot]]
        end
