# Chat

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


## How to setup a chat app for yourself

- Chat App
    - Generate with `mix phx.new chat`
    - DB with `mix ecto.create`
    - Start with mix phx.server
    - Generate channel with `mix [phx.gen.channel](http://phx.gen.channel) NerdwareTalk`
    - Show entry in `user_socket.ex`
    - Show `nerdware_talk_channel.ex`
        - Remove `handle_in` Ping
        - Remove `authorized?`
    - Show `user_socket.js`
        - Replace `let channel = socket.channel("room:42", {})`
        - with `let channel = socket.channel("nerdware_talk:lobby", {})`
    - Show `app.js` and replace `import "user_socker.js"`
        
        with `import socket from "./user_socket.js"`
        
    - Show `endpoint.ex`
        - Add `socket("/socket", ChatWeb.UserSocket, websocket: [connect_info: [session: @session_options]])`
    - Replace `home.html.jeex` with
    
    ```html
    <.flash_group flash={@flash} />
    <div class="px-4 py-10 sm:px-6 sm:py-28 lg:px-8 xl:px-28 xl:py-32">
      <h2>The Nerdware Talk Room</h2>
      <div id="chat-box"></div>
    
      <form id="chat-form">
        <input type="text" placeholder="Username" id="user-name" />
        <textarea placeholder="Your comment" id="user-msg"></textarea>
        <button type="submit">Post</button>
      </form>
    </div>
    
    <style>
      body {
        font-family: "Open Sans", sans-serif;
        background: #222e4d;
        font-size: 14px;
        line-height: 22px;
        overflow-x: hidden;
      }
    
      ::selection {
        background-color: #ffec6e;
        color: #000;
      }
    
      ::-moz-selection {
        background: #46c2ca;
        color: #000;
      }
    
      .container {
        width: 75%;
        height: 100%;
        padding: 20px;
        background-color: #fff;
        top: 100px;
        bottom: 0;
        left: 0;
        right: 0;
        margin: auto;
      }
    
      hr {
        border: 0;
        height: 0;
        border-top: 1px solid #ccc;
      }
    
      a {
        color: rgb(0, 0, 238);
        text-decoration: underline;
      }
    
      .alert:empty {
        display: none;
      }
    
      p.alert.alert-info {
        padding: 7px;
        background: #dff0d8;
      }
    
      p.alert.alert-danger {
        padding: 7px;
        background: #f2dede;
      }
    
      .flash-notice {
        padding: 7px;
        background: #d9edf7;
      }
    
      table {
        border-collapse: collapse;
        width: 100%;
      }
    
      table,
      th,
      td {
        text-align: left;
        padding: 10px;
        border: 1px solid black;
      }
    
      #chat-box {
        border: 1px #000 solid;
        padding: 0 0 0 5px;
        min-height: 157px;
        max-height: 225px;
        overflow: scroll;
      }
    
      #chat-form {
        width: 250px;
      }
    
      #chat-form input[type="text"] {
        width: 250px;
        padding: 5px;
        border: 1px solid #ccc;
        margin-top: 5px;
      }
    
      #chat-form textarea {
        width: 250px;
        padding: 5px;
        border: 1px solid #ccc;
        margin-top: 5px;
      }
    
      .nav-header {
        position: relative;
        width: 100%;
      }
    
      .nav-h1 {
        float: left;
        clear: none;
      }
    
      .nav-header .nav-link {
        float: right;
        margin: -40px 10px 10px 10px;
      }
    
      .nav-header .nav-link a {
        margin-left: 5px;
      }
    
      .nerdware-form {
        margin-bottom: 10px;
      }
    
      .nerdware-form label {
        display: block;
        margin: 0px 0px 5px;
      }
    
      .nerdware-form input[type="text"],
      .nerdware-form input[type="email"],
      .nerdware-form textarea,
      .nerdware-form select {
        border: 1px solid #000;
        color: #000;
        font-size: 14px;
        height: 20px;
        line-height: 15px;
        margin-bottom: 16px;
        margin-right: 6px;
        margin-top: 2px;
        outline: 0 none;
        padding: 5px 0px 5px 5px;
        width: 70%;
      }
    
      .nerdware-form .help-block {
        background: #f2dede;
      }
    
      .nerdware-form select {
        height: 35px;
      }
    
      .nerdware-form textarea {
        height: 100px;
        padding: 5px 0px 0px 5px;
      }
    </style>
    ```
    
    - Create `nerdware_talk.js`
    
    ```jsx
    slet NerdwareTalk = {
        init(socket) {
            let channel = socket.channel('nerdware_talk:lobby', {})
            channel.join()
            this.listenForChats(channel)
        },
    
        listenForChats(channel) {
            document.getElementById('chat-form').addEventListener('submit', function (e) {
                e.preventDefault()
    
                let userName = document.getElementById('user-name').value
                let userMsg = document.getElementById('user-msg').value
    
                channel.push('shout', { name: userName, body: userMsg })
    
                // document.getElementById('user-name').value = '' 
                document.getElementById('user-msg').value = ''
            })
    
            channel.on('shout', payload => {
                let chatBox = document.querySelector('#chat-box')
                let msgBlock = document.createElement('p')
                let message = `${payload.name}: ${payload.body}`
    
                msgBlock.insertAdjacentHTML('beforeend', message)
                chatBox.appendChild(msgBlock)
            })
        }
    }
    
    export default NerdwareTalk
    ```
    
    - Import in `app.js`
    
    ```jsx
    import NerdwareTalk from "./nerdware_talk"
    
    NerdwareTalk.init(socket)
    ```
    
    - Set confg in  `dev.exs`
        - make it accessible through localhost `http: [ip: {127, 0, 0, 1}, port: 4000],`
        - make it accessible from remote web `http: [ip: {0, 0, 0, 0}, port: 4000],`
          - You also need to make port 4000 accessible for on your router
    - Setup DB
        - `mix phx.gen.context Chats Message messages name:string body:text`
        - `mix ecto.migrate`
        - `mix ecto.migrate`
    - in `nerdware_talk_channel.ex`
        - add `alias Chat.Chats`
        - add `Chats.create_message(payload)`
    - in `page_controller.ex`
        
        Add 
        
        Replace `home()`-Function with
        
        ```elixir
        alias Chat.Chats
        
        def home(conn, _params) do
            messages = Chats.list_messages()
            render(conn, :home, layout: false, messages: messages)
          end
        ```
        
    - in `home.html.heex` replace `chat-box`-Div with
        
        ```html
        <div id="chat-box">
              <%= for message <- @messages do %>
              <p><b><%= message.name %>:</b> <%= message.body %></p>
              <% end %>
            </div>
        ```