/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var collection;
$(document).ready(function(){
    collection = new Collection(application);
});

function Collection(application){
    
    var application = application;
    
    (function init(){
        application.setSearchFunction(search);
    })();
    
    function search(term){
        $.ajax({
            url: "/library/collection/find",
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
    
    function createLine(collection, isOdd){
        collection.dateCreated = application.dateUtil.formatDate(collection.dateCreated);
        var compile = '';
        var classLine = isOdd ? "odd" : "even";
        var tr = '<tr class="link '+classLine+'" data-path="/library/collection/show/'+collection.id+'">';
        var tds = '<td>'+collection.code+'</td><td>'+collection.name+'</td><td>'+collection.note+'</td><td class="column-default">'+collection.owner+'</td><td class="column-default">'+collection.dateCreated+'</td>';
        return tr+tds+'</tr>';
    }
}
