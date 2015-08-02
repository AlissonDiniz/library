/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var library;
$(document).ready(function(){
    library = new Library(application);
});

function Library(application){
    
    var application = application;
    
    (function init(){
        application.setSearchFunction(search);
    })();
    
    function search(term){
        $.ajax({
            url: "/library/library/find",
            type: "post",
            dataType: 'json',
            data: {term: term},
            success: function(data) {
                application.injectHtmlResult(createLine, data);
            },
            error: function(xhr) {
                if(xhr.status === 403){
                    application.ShowMessage(i18n.DEFAULT_SYSTEM_DENIED);
                }else{
                    application.ShowMessage(i18n.DEFAULT_SYSTEM_ERROR + xhr.status);
                }
            }
        });
    }
    
    function createLine(library, isOdd){
        library.dateCreated = application.dateUtil.formatDate(library.dateCreated);
        if(!library.note){
            library.note = "";
        }
        var compile = '';
        var classLine = isOdd ? "odd" : "even";
        var tr = '<tr class="link '+classLine+'" data-path="/library/library/show/'+library.id+'">';
        var tds = '<td>'+library.name+'</td><td>'+library.note+'</td><td class="column-default">'+library.owner+'</td><td class="column-default">'+library.dateCreated+'</td>';
        return tr+tds+'</tr>';
    }
}

