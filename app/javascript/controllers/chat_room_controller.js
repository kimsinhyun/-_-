import { Controller } from "@hotwired/stimulus"
import { ChatRoomChannel } from "../channels/chat_room_channel"

export default class extends Controller {
    static values = { roomId: Number }
    connect() {
        console.log("Hello, Stimulus!", this.element)
        ChatRoomChannel.init(this.roomIdValue)
    }
}