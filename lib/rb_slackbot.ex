defmodule RbSlackbot do
  alias RbSlackabot.Slack

  def start(_type, _args) do
    Slack.connect
  end
end
