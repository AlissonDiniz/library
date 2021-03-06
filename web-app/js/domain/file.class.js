/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 Created on : 23/04/2015, 23:31:23
 Author     : Alisson Diniz
 */
var file;
$(document).ready(function () {
    file = new File(application);
});

function File(application) {

    var self = this;
    var service = new FileService(application);

    (function init() {
        application.setSearchFunction(search);
        application.bindSelectAutocomplete();
        $("#tagList").tagit({
            allowSpaces: true,
            placeholderText: i18n.FILE_TAGS_LABEL
        });
        bindAuthorTagsInput();
        bindChooseSubject();
    })();

    function bindAuthorTagsInput() {
        $("#authorListTags").tagit({
            allowSpaces: true,
            minLength: 2,
            placeholderText: i18n.FILE_AUTHORLIST_LABEL,
            requireAutocomplete: true,
            tagSource: function (request, response) {
                var callback = function (data) {
                    response($.map(data, function (item) {
                        return {
                            label: item.name,
                            value: item.name
                        }
                    }));
                };
                service.findAuthor(request.term, callback);
            }
        });
    }

    function bindChooseSubject() {
        $("#subject").combobox({
            select: function (event, ui) {
                var callback = function(data){
                    $("#code").val(data.code);
                    $("button.submit").show();
                    $("#file-form-container").show();
                };
                service.getFileCode($(this).val(), callback);
	    }
        });
    }
    
    function search(term){
        $.ajax({
            url: "/library/file/find",
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
    
    function createLine(file, isOdd){
        var classLine = isOdd ? "odd" : "even";
        var tr = '<tr class="link '+classLine+'" data-path="/library/file/show/'+file.id+'">';
        var tds = '<td>'+file.code+'</td><td>'+file.name+'</td><td>'+file.title+'</td><td>'+file.collection+'</td><td>'+file.type+'</td><td class="column-default">'+file.owner+'</td>';
        return tr+tds+'</tr>';
    }

}
