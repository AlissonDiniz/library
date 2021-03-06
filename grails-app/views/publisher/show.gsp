
<%@ page import="br.com.library.domain.Author" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'publisher.label', default: 'Author')}" />
        <title><g:message code="menu.show.publisher" /></title>
        <r:require module="publisher"/>
    </head>
    <body>
        <div id="legend-page" class="legend-page">
            <h3><g:message code="menu.show.publisher" /></h3>
        </div>
        <ul class="nav nav-pills">
            <li role="presentation">
                <a href="<g:createLink action="index" />">
                    <i class="fa fa-fw fa-tasks"></i>
                    <g:message code="command.index.publisher" />
                </a>
            </li>
            <li role="presentation">
                <a href="<g:createLink action="create" />">
                    <i class="fa fa-fw fa-plus-circle"></i>
                    <g:message code="command.new.publisher" />
                </a>
            </li>
        </ul>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="alert">${flash.message}</div>
        </g:if>
        <div id="show-publisher" class="content scaffold-show" role="main">
            <ol class="property-list publisher">
                <li>
                    <p class="text-title"><g:message code="publisher.name.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${publisherInstance}" field="name"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="publisher.address.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${publisherInstance}" field="address"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="publisher.note.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${publisherInstance}" field="note"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="default.owner.label" /></p>
                    <p class="text-primary"><g:fieldValue bean="${publisherInstance}" field="owner"/></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="default.dateCreated.label" /></p>
                    <p class="text-primary"><g:formatDate date="${publisherInstance?.dateCreated}" format="${message (code: "default.datetime.format")}" /></p>
                </li>
                <li>
                    <p class="text-title"><g:message code="default.lastUpdated.label" /></p>
                    <p class="text-primary"><g:formatDate date="${publisherInstance?.lastUpdated}" format="${message (code: "default.datetime.format")}" /></p>
                </li>
            </ol>
            <div class="col-xs-12 form-group buttons">
                <button type="button" data-path="<g:createLink action="edit" resource="${publisherInstance}" />" class="btn btn-default redirect">
                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> <g:message code="default.button.edit.label" />
                </button>
            </div>
        </div>
    </body>
</html>
