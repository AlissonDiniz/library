<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'subject.label', default: 'Subject')}" />
        <title><g:message code="menu.search.subject" args="[entityName]" /></title>
        <r:require module="search"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.search.subject" /></h3>
        </div>
        <g:form name="form" action="resultSearch" role="form">
            <fieldset class="form form-search">
                <div class="col-xs-8 form-group">
                    <label for="code">
                        <g:message code="subject.code.label" />
                    </label>
                    <g:textField name="code" class="form-control" placeholder="${message (code: "subject.code.label")}" />
                </div>
                <div class="col-xs-8 form-group">
                    <label for="name">
                        <g:message code="subject.name.label" />
                    </label>
                    <g:textField name="name" class="form-control" placeholder="${message (code: "subject.name.label")}" />
                </div>
                <div class="col-xs-8 form-group">
                    <label for="note">
                        <g:message code="subject.note.label" />
                    </label>
                    <g:textField name="note" class="form-control" placeholder="${message (code: "subject.note.label")}" />
                </div>
                <div class="col-xs-12 form-group buttons">
                    <button type="submit" data-form="form" class="btn btn-default">
                        <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span> <g:message code="default.button.search.label" />
                    </button>
                </div>
            </fieldset>
        </g:form>
    </body>
</html>
