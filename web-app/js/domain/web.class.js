/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 Created on : 23/07/2015, 23:31:23
 Author     : Alisson Diniz
 */
var web;
$(document).ready(function () {
    web = new Web(application);
});

function Web(application) {

    var self = this;

    (function init() {
        application.bindSelectAutocomplete();
        $(".year").mask("9999");
    })();
}


