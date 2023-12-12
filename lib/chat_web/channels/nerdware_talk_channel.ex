defmodule ChatWeb.NerdwareTalkChannel do
  use ChatWeb, :channel
  alias Chat.Chats

  @impl true
  def join("nerdware_talk:lobby", payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (nerdware_talk:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    Chats.create_message(payload)
    {:noreply, socket}
  end
end
