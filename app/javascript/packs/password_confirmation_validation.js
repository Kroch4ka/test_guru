document.addEventListener('DOMContentLoaded', () => {
    const pageManager = require('./page_manager')
    const AlertPrompt = require('./alert_prompt')

    if (pageManager.isRegistration()) {
        const password = {
            value: null,
            confirmation: null,
        }

        const notFillPasswordAlertText = 'Вы не заполнили поле с паролем!'
        const notMatchAlertText = 'Введённые пароли не совпадают!!'

        const passwordInput = document.querySelector('#user_password')
        const confirmationInput = document.querySelector('#user_password_confirmation')

        const notFillPasswordAlertPrompt = new AlertPrompt(confirmationInput, notFillPasswordAlertText)
        const notMatchAlertPrompt = new AlertPrompt(confirmationInput, notMatchAlertText)

        const showSuccessConfirmation = () => {
            passwordInput.classList.add('is-success')
            confirmationInput.classList.add('is-success')
            AlertPrompt.hideAllInputPrompts(confirmationInput)
            AlertPrompt.hideAllInputPrompts(passwordInput)
        }

        const hideSuccessConfirmation = () => {
            passwordInput.classList.remove('is-success')
            confirmationInput.classList.remove('is-success')
        }

        const isConfirmed = () => {
            return password.value === password.confirmation && password.value !== null
        }

        const isNotFillPasswordInput = () => {
            return password.value === null
        }

        const isNotFillConfirmationInput = () => {
            return password.confirmation === null
        }

        const showConfirmationStatus = () => {
            hideSuccessConfirmation()
            if (isConfirmed()) {
                showSuccessConfirmation()
                return
            }
            if (isNotFillConfirmationInput()) {
                AlertPrompt.hideAllInputPrompts(confirmationInput)
                return
            }
            if (isNotFillPasswordInput()) {
                notFillPasswordAlertPrompt.show()
                notMatchAlertPrompt.hide()
                return
            }
            notFillPasswordAlertPrompt.hide()
            notMatchAlertPrompt.show()
        }

        const passwordUpdateHandler = (e) => {
            password.value = e.target.value === '' ? null : e.target.value
            showConfirmationStatus()
        }

        const confirmationValidateHandler = (e) => {
            password.confirmation = e.target.value === '' ? null : e.target.value
            showConfirmationStatus()
        }

        passwordInput
            .addEventListener('input', passwordUpdateHandler)

        confirmationInput
            .addEventListener('input', confirmationValidateHandler)
    }
})
