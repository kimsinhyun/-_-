import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["message"]
    static values = { currentUserId: String }

    connect() {
        console.log("current_user_id: " + this.currentUserIdValue)
        this.scrollToBottom()
        this.setupMutationObserver()
    }

    scrollToBottom() {
        this.element.scrollTop = this.element.scrollHeight
    }


    setupMutationObserver() {
        const config = { childList: true, subtree: true }
        const callback = (mutationsList, observer) => {
            for (const mutation of mutationsList) {
                console.log(mutation)
                if (mutation.type === 'childList') {
                    const addedNodes = mutation.addedNodes
                    for (const node of addedNodes) {
                        if (node.nodeType === Node.ELEMENT_NODE && node.hasAttribute('data-user-id')) {
                            const userId = node.getAttribute('data-user-id')
                            if (userId === this.currentUserIdValue) {
                                this.scrollToBottom()
                                break
                            }
                        }
                    }
                }
            }
        }

        const observer = new MutationObserver(callback)
        observer.observe(this.element, config)
    }
}