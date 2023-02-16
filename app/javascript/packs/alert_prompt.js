class AlertPrompt {
    static prompts = {}

    constructor(input, text) {
        this.hidden = true
        this.input = input
        this.alertNode = this._initializeAlertNode(text)
        this._initialize()
    }

    static hideAllInputPrompts(input) {
        this.prompts[input]
            ?.forEach(prompt => prompt.hide())
    }

    show() {
        if (this._isEveryHidden()) {
            this.input.classList.add('is-danger')
        }
        this.alertNode.style.display = 'block'
        this.hidden = false
    }

    hide() {
        this.hidden = true
        if (this._isEveryHidden()) {
            this.input.classList.remove('is-danger')
        }
        this.alertNode.style.display = 'none'
    }

    _isEveryHidden() {
        return AlertPrompt.prompts[this.input].every(prompt => prompt.hidden)
    }

    _initialize() {
        this.input.parentNode.appendChild(this.alertNode)
        AlertPrompt.prompts[this.input] ||= []
        AlertPrompt.prompts[this.input].push(this)
    }

    _initializeAlertNode(text) {
        const node = document.createElement('p')
        node.textContent = text
        node.classList.add('help', 'is-danger')
        node.style.display = 'none'
        return node
    }
}

module.exports = AlertPrompt
