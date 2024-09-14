import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["submit", "input", "form"]

    connect() {
        this.validateInput()
    }

    validateInput() {
        this.submitTarget.disabled = this.inputTarget.value.trim() === ""
    }

    submit(event) {
        event.preventDefault()

        if (this.inputTarget.value.trim() === "") {
            return  // 입력이 비어있으면 제출하지 않음
        }

        const formData = new FormData(this.formTarget)

        fetch(this.formTarget.action, {
            method: this.formTarget.method,
            body: formData,
            headers: {
                "Accept": "text/plain"
            }
        })
            .then(response => response.text())
            .then(html => {
                this.inputTarget.value = ""
                this.validateInput()
            })
    }
}