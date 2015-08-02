
<%@ page import="br.com.library.domain.Library" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'library.label', default: 'Library')}" />
        <title><g:message code="menu.search.result" /></title>
        <r:require module="library"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.search.result" /></h3>
        </div>
        <ul class="nav nav-pills margin-table">
            <li role="presentation">
                <a href="<g:createLink action="search" />">
                    <i class="fa fa-fw fa-search"></i>
                    <g:message code="command.new.search" />
                </a>
            </li>
        </ul>
        <table class="table table-hover library-table">
            <thead>
                <tr>
                    <th><g:message code="library.name.label" /></th>
                    <th><g:message code="library.note.label" /></th>
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
    </body>
</html>
