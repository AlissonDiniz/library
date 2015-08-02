<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'collection.label', default: 'Collection')}" />
        <title><g:message code="menu.report.collection" args="[entityName]" /></title>
        <r:require module="report"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.report.collection" /></h3>
        </div>
        <g:form name="form" action="resultReport" role="form" target="_blank">
            <fieldset class="form form-search">
                <div class="col-xs-8 form-group">
                    <label for="code">
                        <g:message code="collection.code.label" />
                    </label>
                    <g:textField name="code" class="form-control" placeholder="${message (code: "collection.code.label")}" />
                </div>
                <div class="col-xs-8 form-group">
                    <label for="name">
                        <g:message code="collection.name.label" />
                    </label>
                    <g:textField name="name" class="form-control" placeholder="${message (code: "collection.name.label")}" />
                </div>
                <div class="col-xs-8 form-group">
                    <label for="note">
                        <g:message code="collection.note.label" />
                    </label>
                    <g:textField name="note" class="form-control" placeholder="${message (code: "collection.note.label")}" />
                </div>
                <div class="col-xs-8 checkbox">
                    <label for="detail">
                        <g:checkBox name="detail" />
                        <g:message code="default.report-detail.label" />
                    </label>
                </div>
                <div class="col-xs-12 form-group buttons">
                    <button type="submit" data-form="form" class="btn btn-default">
                        <span class="glyphicon glyphicon-file" aria-hidden="true"></span> <g:message code="default.button.generate-report.label" />
                    </button>
                </div>
            </fieldset>
        </g:form>
    </body>
</html>
