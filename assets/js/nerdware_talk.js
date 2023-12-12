let NerdwareTalk = {
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