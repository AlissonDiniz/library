/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var publisher;
$(document).ready(function(){
    publisher = new Publisher(application);
});

function Publisher(application){
    
    var application = application;
    
    (function init(){
        application.setSearchFunction(search);
    })();
    
    function search(term){
        $.ajax({
            url: "/library/publisher/find",
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
    
    function createLine(publisher, isOdd){
        publisher.dateCreated = application.dateUtil.formatDate(publisher.dateCreated);
        if(!publisher.note){
            publisher.note = "";
        }
        var compile = '';
        var classLine = isOdd ? "odd" : "even";
        var tr = '<tr class="link '+classLine+'" data-path="/library/publisher/show/'+publisher.id+'">';
        var tds = '<td>'+publisher.name+'</td><td>'+publisher.address+'</td><td>'+publisher.note+'</td><td class="column-default">'+publisher.owner+'</td><td class="column-default">'+publisher.dateCreated+'</td>';
        return tr+tds+'</tr>';
    }
}
