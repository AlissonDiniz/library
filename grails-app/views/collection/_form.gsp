<%@ page import="br.com.library.domain.Collection" %>

<div class="col-xs-8 form-group ${hasErrors(bean: collectionInstance, field: 'library', 'has-error')}">
    <label for="library">
        <g:message code="collection.library.label" default="Library" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="library" name="library.id" from="${br.com.library.domain.Library.list()}" optionKey="id" class="validate required form-control" value="${collectionInstance?.library?.id}" />
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>

<div class="col-xs-8 form-group ${hasErrors(bean: collectionInstance, field: 'code', 'has-error')}">
    <label for="code">
        <g:message code="collection.code.label" default="Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="code" class="validate required form-control" value="${collectionInstance?.code}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>

<div class="col-xs-8 form-group ${hasErrors(bean: collectionInstance, field: 'name', 'has-error')}">
    <label for="name">
        <g:message code="collection.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" class="validate required form-control" value="${collectionInstance?.name}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>

<div class="col-xs-8 form-group ${hasErrors(bean: collectionInstance, field: 'note', 'has-error')}">
    <label for="note">
        <g:message code="collection.note.label" default="Note" />
    </label>
    <g:textArea name="note" class="form-control" rows="5" cols="40" value="${collectionInstance?.note}" />
</div>
<g:hiddenField name="owner" value="${sec.loggedInUserInfo(field:'username')}" />

