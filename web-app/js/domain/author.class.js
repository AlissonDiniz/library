/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var author;
$(document).ready(function(){
    author = new Author(application);
});

function Author(application){
    
    var application = application;
    
    (function init(){
        application.setSearchFunction(search);
    })();
    
    function search(term){
        $.ajax({
            url: "/library/author/find",
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
    
    function createLine(author, isOdd){
        author.dateCreated = application.dateUtil.formatDate(author.dateCreated);
        if(!author.note){
            author.note = "";
        }
        var compile = '';
        var classLine = isOdd ? "odd" : "even";
        var tr = '<tr class="link '+classLine+'" data-path="/library/author/show/'+author.id+'">';
        var tds = '<td>'+author.name+'</td><td>'+author.address+'</td><td>'+author.note+'</td><td class="column-default">'+author.owner+'</td><td class="column-default">'+author.dateCreated+'</td>';
        return tr+tds+'</tr>';
    }
}
