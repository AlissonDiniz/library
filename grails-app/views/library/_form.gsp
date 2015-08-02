<%@ page import="br.com.library.domain.Library" %>

<div class="col-xs-8 form-group ${hasErrors(bean: libraryInstance, field: 'name', 'has-error')}">
    <label for="name">
        <g:message code="library.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" class="validate required form-control" value="${libraryInstance?.name}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>

<div class="col-xs-8 form-group ${hasErrors(bean: libraryInstance, field: 'note', 'has-error')}">
    <label for="note">
        <g:message code="library.note.label" default="Note" />
    </label>
    <g:textArea name="note" class="form-control" rows="5" cols="40" value="${libraryInstance?.note}" />
</div>
<g:hiddenField name="owner" value="${sec.loggedInUserInfo(field:'username')}" />
