module.exports = {
    isRegistration: () => {
        return window.location.href.match('sign_up')
    },
    isTests: () => {
        return window.location.pathname === '/' && document.querySelector('#tests')
    }
}
