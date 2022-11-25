(app => {


    app._changeView = viewId => {
        let sections = document.querySelectorAll('main > section');
        sections.forEach(section => {
            section.classList.remove('active');
        });
        console.log(viewId);
        document.getElementById(viewId).classList.add('active');
    };

})(app || (app = {}));