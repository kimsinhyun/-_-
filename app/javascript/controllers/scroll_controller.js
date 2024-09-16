import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.scrollToBottom()
        this.element.addEventListener("turbo:frame-load", this.maintainScrollPosition.bind(this))
    }

    scrollToBottom() {
        this.element.scrollTop = this.element.scrollHeight
    }

    maintainScrollPosition() {
        const oldScrollHeight = this.element.scrollHeight
        const oldScrollTop = this.element.scrollTop

        setTimeout(() => {
            const newScrollHeight = this.element.scrollHeight
            this.element.scrollTop = newScrollHeight - oldScrollHeight + oldScrollTop
        }, 0)
    }
}