
<%@ page import="br.com.library.domain.Collection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'subject.label', default: 'Subject')}" />
        <title><g:message code="menu.search.result" /></title>
        <r:require module="subject"/>
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
        <table class="table table-hover subject-table">
            <thead>
                <tr>
                    <th><g:message code="subject.code.label" /></th>
                    <th><g:message code="subject.name.label" /></th>
                    <th><g:message code="subject.note.label" /></th>
                    <th class="column-default"><g:message code="default.owner.label" /></th>
                    <th class="column-default"><g:message code="default.dateCreated.label" /></th>
                </tr>
            </thead>
            <tbody>
            <g:each in="${subjectInstanceList}" status="i" var="subjectInstance">
                <tr class="link ${(i % 2) == 0 ? 'even' : 'odd'}" data-path="<g:createLink action="show" id="${subjectInstance.id}"/>">
                    <td>${fieldValue(bean: subjectInstance, field: "code")}</td>
                    <td>${fieldValue(bean: subjectInstance, field: "name")}</td>
                    <td>${fieldValue(bean: subjectInstance, field: "note")}</td>
                    <td class="column-default">${fieldValue(bean: subjectInstance, field: "owner")}</td>
                    <td class="column-default"><g:formatDate date="${subjectInstance.dateCreated}" format="${message (code: "default.datetime.format")}" /></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </body>
</html>
