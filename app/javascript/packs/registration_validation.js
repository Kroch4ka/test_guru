document.addEventListener('DOMContentLoaded', () => {
    const pageManager = require('./page_manager')
    const AlertPrompt = require('./alert_prompt')

    if (pageManager.isRegistration()) {

        const state = {
            password: {
                value: null,
                confirmation: null,
                isValid: false
            }
        }

        const notFeelPasswordAlertText = 'Вы не заполнили поле с паролем!'
        const doesntMatchAlertText = 'Введённые пароли не совпадают!!'

        const passwordInput = document.querySelector('#user_password')
        const confirmationInput = document.querySelector('#user_password_confirmation')

        const notFeelPasswordAlertPrompt = new AlertPrompt(confirmationInput, notFeelPasswordAlertText)
        const notMatchAlertPrompt = new AlertPrompt(confirmationInput, doesntMatchAlertText)

        const checkSuccessConfirmation = () => {
            if (state.password.isValid) {
                passwordInput.classList.add('is-success')
                confirmationInput.classList.add('is-success')
            } else {
                passwordInput.classList.remove('is-success')
                confirmationInput.classList.remove('is-success')
            }
        }

        const passwordUpdateHandler = (e) => {
            state.password.value = e.target.value === '' ? null : e.target.value
            state.password.isValid = false

            if (!state.password.confirmation) {
                notFeelPasswordAlertPrompt.hideAllPrompts()
            } else {
                if (state.password.value) {
                    if (state.password.value === state.password.confirmation) {
                        state.password.isValid = true
                        notFeelPasswordAlertPrompt.hide()
                        notMatchAlertPrompt.hide()
                    } else {
                        notMatchAlertPrompt.show()
                    }
                } else {
                    notFeelPasswordAlertPrompt.show()
                    notMatchAlertPrompt.hide()
                }
            }

            checkSuccessConfirmation()
        }

        const confirmationValidateHandler = (e) => {
            state.password.confirmation = e.target.value === '' ? null : e.target.value
            state.password.isValid = false

            if (!state.password.confirmation) {
                notFeelPasswordAlertPrompt.hideAllPrompts()
            } else {
                if (!state.password.value) {
                    notFeelPasswordAlertPrompt.show()
                } else {
                    notFeelPasswordAlertPrompt.hide()
                    if (state.password.confirmation === state.password.value) {
                        state.password.isValid = true
                        notMatchAlertPrompt.hide()
                    } else {
                        notMatchAlertPrompt.show()
                    }
                }
            }

            checkSuccessConfirmation()
        }

        passwordInput
            .addEventListener('input', passwordUpdateHandler)

        confirmationInput
            .addEventListener('input', confirmationValidateHandler)
    }
})