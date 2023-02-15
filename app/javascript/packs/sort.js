document.addEventListener('DOMContentLoaded', () => {
    const pageManager = require('./page_manager')

    if (pageManager.isRoot()) {
        const sortHandler = (e) => {
            const orderValue = e.target.value
            const searchParams = new URL(window.location.href).searchParams
            searchParams.set('order', orderValue)
            window.location.search = searchParams.toString()
        }

        document.querySelector('#sort')
            .addEventListener('change', sortHandler)
    }
});
