/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 Created on : 23/04/2015, 23:31:23
 Author     : Alisson Diniz
 */

function FileService(application) {

    var application = application;
    var self = this;
    
    function findAuthor(term, callback) {
        $.ajax({
            url: "/library/author/findByName",
            type: "GET",
            dataType: 'json',
            data: {term: term}
        }).done(function (data) {
            callback(data);
        }).fail(function (xhr) {
            if (xhr.status === 403) {
                application.ShowMessage(i18n.DEFAULT_SYSTEM_DENIED);
            } else {
                application.ShowMessage(i18n.DEFAULT_SYSTEM_ERROR + xhr.status);
            }
        });
    };
    
    function getFileCode(subjectId, callback) {
        application.ShowWait();
        $.ajax({
            url: "/library/subject/getFileCode",
            type: "GET",
            dataType: 'json',
            data: {subjectId: subjectId}
        }).done(function (data) {
            callback(data);
        }).fail(function (xhr) {
            if (xhr.status === 403) {
                application.ShowMessage(i18n.DEFAULT_SYSTEM_DENIED);
            } else {
                application.ShowMessage(i18n.DEFAULT_SYSTEM_ERROR + xhr.status);
            }
        }).always(function () {
            application.CloseWait();
        });
    };

    self.findAuthor = findAuthor;
    self.getFileCode = getFileCode;
}
