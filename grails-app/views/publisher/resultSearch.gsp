
<%@ page import="br.com.library.domain.Publisher" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'publisher.label', default: 'Publisher')}" />
        <title><g:message code="menu.search.result" /></title>
        <r:require module="publisher"/>
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
        <table class="table table-hover publisher-table">
            <thead>
                <tr>
                    <th><g:message code="publisher.name.label" /></th>
                    <th><g:message code="publisher.address.label" /></th>
                    <th><g:message code="publisher.note.label" /></th>
                    <th class="column-default"><g:message code="default.owner.label" /></th>
                    <th class="column-default"><g:message code="default.dateCreated.label" /></th>
                </tr>
            </thead>
            <tbody>
            <g:each in="${publisherInstanceList}" status="i" var="publisherInstance">
                <tr class="link ${(i % 2) == 0 ? 'even' : 'odd'}" data-path="<g:createLink action="show" id="${publisherInstance.id}"/>">
                    <td>${fieldValue(bean: publisherInstance, field: "name")}</td>
                    <td>${fieldValue(bean: publisherInstance, field: "address")}</td>
                    <td>${fieldValue(bean: publisherInstance, field: "note")}</td>
                    <td class="column-default">${fieldValue(bean: publisherInstance, field: "owner")}</td>
                    <td class="column-default"><g:formatDate date="${publisherInstance.dateCreated}" format="${message (code: "default.datetime.format")}" /></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </body>
</html>
