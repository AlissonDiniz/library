
<%@ page import="br.com.library.domain.Author" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}" />
        <title><g:message code="menu.search.result" /></title>
        <r:require module="author"/>
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
        <table class="table table-hover author-table">
            <thead>
                <tr>
                    <g:sortableColumn property="name" title="${message(code: 'author.name.label')}" />
                    <g:sortableColumn property="address" title="${message(code: 'author.address.label')}" />
                    <g:sortableColumn property="note" title="${message(code: 'author.note.label')}" />
                    <th class="column-default"><g:message code="default.owner.label" /></th>
                    <th class="column-default"><g:message code="default.dateCreated.label" /></th>
                </tr>
            </thead>
            <tbody>
            <g:each in="${authorInstanceList}" status="i" var="authorInstance">
                <tr class="link ${(i % 2) == 0 ? 'even' : 'odd'}" data-path="<g:createLink action="show" id="${authorInstance.id}"/>">
                    <td>${fieldValue(bean: authorInstance, field: "name")}</td>
                    <td>${fieldValue(bean: authorInstance, field: "address")}</td>
                    <td>${fieldValue(bean: authorInstance, field: "note")}</td>
                    <td class="column-default">${fieldValue(bean: authorInstance, field: "owner")}</td>
                    <td class="column-default"><g:formatDate date="${authorInstance.dateCreated}" format="${message (code: "default.datetime.format")}" /></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </body>
</html>
