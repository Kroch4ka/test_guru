module.exports = {
    isRegistration: () => {
        return window.location.href.match('sign_up')
    },
    isRoot: () => {
        return window.location.pathname === '/'
    }
}
