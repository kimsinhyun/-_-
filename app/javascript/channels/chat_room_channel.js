import consumer from "./index"

export const ChatRoomChannel = {
    init(roomId) {
        consumer.subscriptions.create({ channel: "ChatRoomChannel", room_id: roomId }, {
            connected() {
                console.log("Connected to the chat room")
            },

            disconnected() {
                // Called when the subscription has been terminated by the server
            },

            received(data) {
                // Called when there's incoming data on the websocket for this channel
            },

            speak: function(message) {
                return this.perform('speak', { message: message });
            }
        });
    }
}