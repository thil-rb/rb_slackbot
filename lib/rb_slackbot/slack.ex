defmodule RbSlackabot.Slack do
  alias RbSlackabot.Sockets.Web
  alias RbSlackabot.Client

  def connect do
    Web.start_link(Client.connect_url, __MODULE__)
  end

  def handle(message = %{type: "message", channel: channel, text: "thil" <> text}) do
    send self, %{text: "hi there", channel: channel }
  end

  def handle(m), do: IO.inspect m
end
