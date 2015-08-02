<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'publisher.label', default: 'Publisher')}" />
        <title><g:message code="menu.search.publisher" args="[entityName]" /></title>
        <r:require module="search"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.search.publisher" /></h3>
        </div>
        <g:form name="form" action="resultSearch" role="form">
            <fieldset class="form form-search">
                <div class="col-xs-8 form-group">
                    <label for="name">
                        <g:message code="publisher.name.label" />
                    </label>
                    <g:textField name="name" class="form-control" placeholder="${message (code: "publisher.name.label")}" />
                </div>
                <div class="col-xs-8 form-group">
                    <label for="address">
                        <g:message code="publisher.address.label" />
                    </label>
                    <g:textField name="address" class="form-control" placeholder="${message (code: "publisher.address.label")}" />
                </div>
                <div class="col-xs-8 form-group">
                    <label for="note">
                        <g:message code="publisher.note.label" />
                    </label>
                    <g:textField name="note" class="form-control" placeholder="${message (code: "publisher.note.label")}" />
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
