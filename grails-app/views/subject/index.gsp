
<%@ page import="br.com.library.domain.Subject" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'subject.label', default: 'subject')}" />
        <title><g:message code="menu.index.subject" /></title>
        <r:require module="subject"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.index.subject" /></h3>
        </div>
        <ul class="nav nav-pills">
            <li role="presentation">
                <a href="<g:createLink action="create" />">
                    <i class="fa fa-fw fa-plus-circle"></i>
                    <g:message code="command.new.subject" />
                </a>
            </li>
        </ul>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="alert">${flash.message}</div>
        </g:if>
        <g:render template="/components/quick-search" />
        <table class="table table-hover subject-table">
            <thead>
                <tr>
                    <g:sortableColumn property="code" title="${message(code: 'subject.code.label')}" />
                    <g:sortableColumn property="name" title="${message(code: 'subject.name.label')}" />
                    <g:sortableColumn property="note" title="${message(code: 'subject.note.label')}" />
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
        <div class="pagination">
            <g:paginate total="${subjectInstanceCount ?: 0}" />
        </div>
    </body>
</html>
