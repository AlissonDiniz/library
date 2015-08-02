
<%@ page import="br.com.library.domain.File" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'file.label', default: 'File')}" />
        <title><g:message code="menu.show.file" /></title>
        <r:require module="file"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.show.file" /></h3>
        </div>
        <ul class="nav nav-pills">
            <li role="presentation">
                <a href="<g:createLink action="index" />">
                    <i class="fa fa-fw fa-tasks"></i>
                    <g:message code="command.index.file" />
                </a>
            </li>
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
        <div id="show-file" class="content scaffold-show" role="main">
            <ol class="property-list file">
                <li>
                    <p class="text-title"><g:message code="file.code.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${fileInstance}" field="code"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.name.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${fileInstance}" field="name"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.title.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${fileInstance}" field="title"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.collection.label" /></p>
                    <p class="text-primary"><g:link controller="collection" action="show" id="${fileInstance?.collection?.id}">${fileInstance?.collection?.encodeAsHTML()}</g:link></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.authorList.label" /></p>
                    <g:each in="${fileInstance.authorList}" var="a">
                        <p class="text-primary"><g:link controller="author" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></p>
                    </g:each>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.publisher.label" /></p>
                    <p class="text-primary"><g:link controller="publisher" action="show" id="${fileInstance?.publisher?.id}">${fileInstance?.publisher?.encodeAsHTML()}</g:link></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.storage.label" /></p>
                    <p class="text-primary"><g:link controller="storage" action="show" id="${fileInstance?.storage?.id}">${fileInstance?.storage?.encodeAsHTML()}</g:link></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.subject.label" /></p>
                    <p class="text-primary"><g:link controller="subject" action="show" id="${fileInstance?.subject?.id}">${fileInstance?.subject?.encodeAsHTML()}</g:link></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.tags.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${fileInstance}" field="tagList"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.type.label" /></p>
                    <p class="text-primary"><g:link controller="fileType" action="show" id="${fileInstance?.type?.id}">${fileInstance?.type?.encodeAsHTML()}</g:link></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.periodInit.label" /></p>
                    <p class="text-primary"><g:formatDate date="${fileInstance?.periodInit}" format="${message (code: "default.date.format")}" /></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.periodEnd.label" /></p>
                    <p class="text-primary"><g:formatDate date="${fileInstance?.periodEnd}" format="${message (code: "default.date.format")}" /></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.description.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${fileInstance}" field="description"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="file.note.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${fileInstance}" field="note"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="default.owner.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${fileInstance}" field="owner"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="default.dateCreated.label" /></p>
                    <p class="text-primary"><g:formatDate date="${fileInstance?.dateCreated}" format="${message (code: "default.datetime.format")}" /></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="default.lastUpdated.label" /></p>
                    <p class="text-primary"><g:formatDate date="${fileInstance?.lastUpdated}" format="${message (code: "default.datetime.format")}" /></p>
                </li>
            </ol>
            <div class="col-xs-12 form-group buttons">
                <button type="button" data-path="<g:createLink action="edit" resource="${fileInstance}" />" class="btn btn-default redirect">
                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> <g:message code="default.button.edit.label" />
                </button>
            </div>
        </div>
    </body>
</html>
