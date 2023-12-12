defmodule ChatWeb.PageController do
  use ChatWeb, :controller

  alias Chat.Chats

  def home(conn, _params) do
    messages = Chats.list_messages()
    render(conn, :home, layout: false, messages: messages)
  end
end
