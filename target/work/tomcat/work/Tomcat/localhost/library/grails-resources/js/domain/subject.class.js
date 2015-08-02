/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var subject;
$(document).ready(function(){
    subject = new Subject(application);
});

function Subject(application){
    
    var application = application;
    
    (function init(){
        application.setSearchFunction(search);
    })();
    
    function search(term){
        $.ajax({
            url: "/library/subject/find",
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
    
    function createLine(subject, isOdd){
        subject.dateCreated = application.dateUtil.formatDate(subject.dateCreated);
        if(!subject.note){
            subject.note = "";
        }
        var compile = '';
        var classLine = isOdd ? "odd" : "even";
        var tr = '<tr class="link '+classLine+'" data-path="/library/subject/show/'+subject.id+'">';
        var tds = '<td>'+subject.code+'</td><td>'+subject.name+'</td><td>'+subject.note+'</td><td class="column-default">'+subject.owner+'</td><td class="column-default">'+subject.dateCreated+'</td>';
        return tr+tds+'</tr>';
    }
}
