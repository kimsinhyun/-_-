// import consumer from "./index"

// @deprecated: turbo stream is used instead

// export const ChatRoomChannel = {
//     init(chatRoomId) {
//         consumer.subscriptions.create({ channel: "ChatRoomChannel", chat_room_id: chatRoomId }, {
//             connected() {
//                 // Called when the subscription is ready for use on the server
//                 console.log('connected to chat room channel')
//             },
//
//             disconnected() {
//                 // Called when the subscription has been terminated by the server
//                 console.log('disconnected from chat room channel')
//             },
//
//             received(data) {
//                 // Called when there's incoming data on the websocket for this channel
//                 console.log(data)
//             },
//
//             speak: function(message) {
//                 return this.perform('speak', { message: message });
//             }
//         });
//     }
// }