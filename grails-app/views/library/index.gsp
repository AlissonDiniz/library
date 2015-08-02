
<%@ page import="br.com.library.domain.Library" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'library.label', default: 'Library')}" />
        <title><g:message code="menu.index.library" /></title>
        <r:require module="library"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.index.library" /></h3>
        </div>
        <ul class="nav nav-pills">
            <li role="presentation">
                <a href="<g:createLink action="create" />">
                    <i class="fa fa-fw fa-plus-circle"></i>
                    <g:message code="command.new.library" />
                </a>
            </li>
        </ul>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="alert">${flash.message}</div>
        </g:if>
        <g:render template="/components/quick-search" />
        <table class="table table-hover library-table">
            <thead>
                <tr>
                    <g:sortableColumn property="name" title="${message(code: 'library.name.label')}" />
                    <g:sortableColumn property="note" title="${message(code: 'library.note.label')}" />
                    <th class="column-default"><g:message code="default.owner.label" /></th>
                    <th class="column-default"><g:message code="default.dateCreated.label" /></th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${libraryInstanceList}" status="i" var="libraryInstance">
                    <tr class="link ${(i % 2) == 0 ? 'even' : 'odd'}" data-path="<g:createLink action="show" id="${libraryInstance.id}"/>">
                        <td>${fieldValue(bean: libraryInstance, field: "name")}</td>
                        <td>${fieldValue(bean: libraryInstance, field: "note")}</td>
                        <td class="column-default">${fieldValue(bean: libraryInstance, field: "owner")}</td>
                        <td class="column-default"><g:formatDate date="${libraryInstance.dateCreated}" format="${message (code: "default.datetime.format")}" /></td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${libraryInstanceCount ?: 0}" />
        </div>
    </body>
</html>
