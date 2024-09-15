import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input"]

    connect() {
        console.log("ChatRoom controller connected")
    }

    handleKeyPress(event) {
        if (event.key === 'Enter' && !event.shiftKey) {
            event.preventDefault()
            this.submit()
        }
    }

    submit() {
        if (this.inputTarget.value.trim() === "") {
            return  // 입력이 비어있으면 제출하지 않음
        }

        const formData = new FormData(this.element)

        fetch(this.element.action, {
            method: this.element.method,
            body: formData,
            headers: {
                "Accept": "text/vnd.turbo-stream.html",
                "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
            }
        })
            .then(response => response.text())
            .then(html => {
                Turbo.renderStreamMessage(html)
                this.inputTarget.value = ""
            })
    }
}