(app => {

    var isLoaded;
    app.homeView = {
        load: function(){
            console.log("began");
            var frag = document.createDocumentFragment();
            var temp = document.getElementsByTagName("template")[0];
            let newNode = temp.content.cloneNode(true);
            frag.append(newNode);
            document.querySelector("#sign-in-container").append(frag);
            app._changeView('homeView');
           
        }
    }
})(app || (app = {}));