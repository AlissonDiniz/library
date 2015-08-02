<%@ page import="br.com.library.domain.Author" %>

<div class="col-xs-8 form-group ${hasErrors(bean: authorInstance, field: 'name', 'has-error')}">
    <label for="name">
        <g:message code="author.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" class="validate required form-control" value="${authorInstance?.name}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>

<div class="col-xs-8 form-group ${hasErrors(bean: authorInstance, field: 'address', 'has-error')}">
    <label for="address">
        <g:message code="author.address.label" default="address" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="address" class="validate required form-control" value="${authorInstance?.address}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>

<div class="col-xs-8 form-group ${hasErrors(bean: authorInstance, field: 'note', 'has-error')}">
    <label for="note">
        <g:message code="author.note.label" default="Note" />
    </label>
    <g:textArea name="note" class="form-control" rows="5" cols="40" value="${authorInstance?.note}" />
</div>
<g:hiddenField name="owner" value="${sec.loggedInUserInfo(field:'username')}" />

