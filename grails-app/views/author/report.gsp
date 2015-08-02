<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}" />
        <title><g:message code="menu.report.author" args="[entityName]" /></title>
        <r:require module="report"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.report.author" /></h3>
        </div>
        <g:form name="form" action="resultReport" role="form" target="_blank">
            <fieldset class="form form-search">
                <div class="col-xs-8 form-group">
                    <label for="name">
                        <g:message code="author.name.label" />
                    </label>
                    <g:textField name="name" class="form-control" placeholder="${message (code: "author.name.label")}" />
                </div>
                <div class="col-xs-8 form-group">
                    <label for="address">
                        <g:message code="author.address.label" />
                    </label>
                    <g:textField name="address" class="form-control" placeholder="${message (code: "author.address.label")}" />
                </div>
                <div class="col-xs-8 form-group">
                    <label for="note">
                        <g:message code="author.note.label" />
                    </label>
                    <g:textField name="note" class="form-control" placeholder="${message (code: "author.note.label")}" />
                </div>
                <div class="col-xs-8 checkbox">
                    <label for="detail">
                        <g:checkBox name="detail" />
                        <g:message code="default.report-detail.label" />
                    </label>
                </div>
                <div class="col-xs-12 form-group buttons">
                    <button type="submit" data-form="form" class="btn btn-default">
                        <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span> <g:message code="default.button.generate-report.label" />
                    </button>
                </div>
            </fieldset>
        </g:form>
    </body>
</html>
