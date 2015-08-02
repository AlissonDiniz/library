
<%@ page import="br.com.library.domain.File" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'file.label', default: 'File')}" />
        <title><g:message code="menu.index.file" /></title>
        <r:require module="file"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.index.file" /></h3>
        </div>
        <ul class="nav nav-pills">
            <li role="presentation">
                <a href="<g:createLink action="create" />">
                    <i class="fa fa-fw fa-plus-circle"></i>
                    <g:message code="command.new.file" />
                </a>
            </li>
        </ul>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="alert">${flash.message}</div>
        </g:if>
        <g:render template="/components/quick-search" />
        <table class="table table-hover file-table">
            <thead>
                <tr>
                    <g:sortableColumn property="code" title="${message(code: 'file.code.label')}" />
                    <g:sortableColumn property="name" title="${message(code: 'file.name.label')}" />
                    <g:sortableColumn property="title" title="${message(code: 'file.title.label')}" />
                    <th><g:message code="file.collection.label" /></th>
                    <th><g:message code="file.type.label" /></th>
                    <th class="column-default"><g:message code="default.owner.label" /></th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${fileInstanceList}" status="i" var="fileInstance">
                    <tr class="link ${(i % 2) == 0 ? 'even' : 'odd'}" data-path="<g:createLink action="show" id="${fileInstance.id}"/>">
                    <td>${fieldValue(bean: fileInstance, field: "code")}</td>
                    <td>${fieldValue(bean: fileInstance, field: "name")}</td>
                    <td>${fieldValue(bean: fileInstance, field: "title")}</td>
                    <td>${fieldValue(bean: fileInstance, field: "collection")}</td>
                    <td>${fieldValue(bean: fileInstance, field: "type")}</td>
                    <td class="column-default">${fieldValue(bean: fileInstance, field: "owner")}</td>
                </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${fileInstanceCount ?: 0}" />
        </div>
    </body>
</html>
