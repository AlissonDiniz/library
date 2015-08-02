
<%@ page import="br.com.library.domain.Collection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'collection.label', default: 'Collection')}" />
        <title><g:message code="menu.show.collection" /></title>
        <r:require module="collection"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.show.collection" /></h3>
        </div>
        <ul class="nav nav-pills">
            <li role="presentation">
                <a href="<g:createLink action="index" />">
                    <i class="fa fa-fw fa-tasks"></i>
                    <g:message code="command.index.collection" />
                </a>
            </li>
            <li role="presentation">
                <a href="<g:createLink action="create" />">
                    <i class="fa fa-fw fa-plus-circle"></i>
                    <g:message code="command.new.collection" />
                </a>
            </li>
        </ul>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="alert">${flash.message}</div>
        </g:if>
        <div id="show-collection" class="content scaffold-show" role="main">
            <ol class="property-list collection">
                <li>
                    <p class="text-title"><g:message code="collection.library.label" /></p>
                    <p class="text-primary"><g:link controller="library" action="show" id="${collectionInstance?.library?.id}">${collectionInstance?.library?.encodeAsHTML()}</g:link></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="collection.code.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${collectionInstance}" field="code"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="collection.name.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${collectionInstance}" field="name"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="collection.note.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${collectionInstance}" field="note"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="default.owner.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${collectionInstance}" field="owner"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="default.dateCreated.label" /></p>
                    <p class="text-primary"><g:formatDate date="${collectionInstance?.dateCreated}" format="${message (code: "default.datetime.format")}" /></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="default.lastUpdated.label" /></p>
                    <p class="text-primary"><g:formatDate date="${collectionInstance?.lastUpdated}" format="${message (code: "default.datetime.format")}" /></p>
                </li>
            </ol>
            <div class="col-xs-12 form-group buttons">
                <button type="button" data-path="<g:createLink action="edit" resource="${collectionInstance}" />" class="btn btn-default redirect">
                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> <g:message code="default.button.edit.label" />
                </button>
            </div>
        </div>
    </body>
</html>
