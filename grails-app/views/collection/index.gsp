
<%@ page import="br.com.library.domain.Collection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'collection.label', default: 'Collection')}" />
        <title><g:message code="menu.index.collection" /></title>
        <r:require module="collection"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.index.collection" /></h3>
        </div>
        <ul class="nav nav-pills">
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
        <g:render template="/components/quick-search" />
        <table class="table table-hover collection-table">
            <thead>
                <tr>
                    <g:sortableColumn property="code" title="${message(code: 'collection.code.label')}" />
                    <g:sortableColumn property="name" title="${message(code: 'collection.name.label')}" />
                    <th><g:message code="collection.library.label" /></th>
                    <g:sortableColumn property="note" title="${message(code: 'collection.note.label')}" />
                    <th class="column-default"><g:message code="default.owner.label" /></th>
                    <th class="column-default"><g:message code="default.dateCreated.label" /></th>
                </tr>
            </thead>
            <tbody>
            <g:each in="${collectionInstanceList}" status="i" var="collectionInstance">
                <tr class="link ${(i % 2) == 0 ? 'even' : 'odd'}" data-path="<g:createLink action="show" id="${collectionInstance.id}"/>">
                    <td>${fieldValue(bean: collectionInstance, field: "code")}</td>
                    <td>${fieldValue(bean: collectionInstance, field: "name")}</td>
                    <td>${fieldValue(bean: collectionInstance, field: "library")}</td>
                    <td>${fieldValue(bean: collectionInstance, field: "note")}</td>
                    <td class="column-default">${fieldValue(bean: collectionInstance, field: "owner")}</td>
                    <td class="column-default"><g:formatDate date="${collectionInstance.dateCreated}" format="${message (code: "default.datetime.format")}" /></td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${collectionInstanceCount ?: 0}" />
        </div>
    </body>
</html>
