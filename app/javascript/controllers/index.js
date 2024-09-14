// app/javascript/controllers/index.js
import { application } from "./application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import ChatRoomController from "./chat_room_controller"

// Eager load all controllers defined in the import map under controllers/**/*_controller
eagerLoadControllersFrom("controllers", application)

// Manually register ChatRoomController
application.register("chat-room", ChatRoomController)
