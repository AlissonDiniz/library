<%@ page import="br.com.library.domain.File" %>

<div class="col-xs-8 form-group select ${hasErrors(bean: fileInstance, field: 'collection', 'has-error')}">
    <label for="collection">
        <g:message code="file.collection.label" default="Collection" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="collection" name="collection.id" from="${br.com.library.domain.Collection.list()}" optionKey="id" class="validate required combobox form-control" value="${fileInstance?.collection?.id}" noSelection="${['': message (code: "default.field.noSelection")]}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>
<div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'authorList', 'has-error')}">
    <label for="authorList">
        <g:message code="file.authorList.label" default="Author List" />
    </label>
    <input id="authorListTags" name="authorListTags" type="text" class="form-control" value="<g:each in="${fileInstance.authorList}" var="a">${a.name},</g:each>" >
</div>
<div class="col-xs-8 form-group select ${hasErrors(bean: fileInstance, field: 'publisher', 'has-error')}">
    <label for="publisher">
        <g:message code="file.publisher.label" default="Publisher" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="publisher" name="publisher.id" from="${br.com.library.domain.Publisher.list()}" optionKey="id" class="validate required combobox form-control" value="${fileInstance?.publisher?.id}" noSelection="${['': message (code: "default.field.noSelection")]}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>
<div class="col-xs-8 form-group select ${hasErrors(bean: fileInstance, field: 'storage', 'has-error')}">
    <label for="storage">
        <g:message code="file.storage.label" default="Storage" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="storage" name="storage.id" from="${br.com.library.domain.Storage.list()}" optionKey="id" class="validate required combobox form-control" value="${fileInstance?.storage?.id}" noSelection="${['': message (code: "default.field.noSelection")]}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>
<div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'subject', 'has-error')}">
    <label for="subject">
        <g:message code="file.subject.label" default="Subject" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="subject" name="subject.id" from="${br.com.library.domain.Subject.list()}" optionKey="id" class="validate required combobox-custom form-control" value="${fileInstance?.subject?.id}" noSelection="${['': message (code: "default.field.noSelection")]}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>
<div id="file-form-container" class="file-form-container">
    <div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'code', 'has-error')}">
        <label for="code">
            <g:message code="file.code.label" default="Code" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="code" class="validate required form-control" value="${fileInstance?.code}" />
        <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
    </div>
    <div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'name', 'has-error')}">
        <label for="name">
            <g:message code="file.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="name" class="validate required form-control" value="${fileInstance?.name}"/>
        <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
    </div>
    <div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'title', 'has-error')}">
        <label for="title">
            <g:message code="file.title.label" default="Title" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="title" class="validate required form-control" value="${fileInstance?.title}"/>
        <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
    </div>
    <div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'location', 'has-error')}">
        <label for="location">
            <g:message code="file.location.label" default="Location" />
        </label>
        <g:textField name="location" class="form-control" value="${fileInstance?.location}"/>
    </div>
    <div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'edition', 'has-error')}">
        <label for="edition">
            <g:message code="file.edition.label" default="Edition" />
        </label>
        <g:textField name="edition" class="form-control" value="${fileInstance?.edition}"/>
    </div>
    <div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'type', 'has-error')}">
        <label for="type">
            <g:message code="file.type.label" default="Type" />
            <span class="required-indicator">*</span>
        </label>
        <g:select id="type" name="type.id" from="${br.com.library.domain.FileType.list()}" optionKey="id" class="validate required combobox form-control" value="${fileInstance?.type?.id}"/>
        <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
    </div>
    <div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'tagList', 'has-error')}">
        <label for="tagList">
            <g:message code="file.tagList.label" default="Tag List" />
        </label>
        <g:textField name="tagList" class="form-control" value="${fileInstance?.tagList}"/>
    </div>
    <div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'description', 'has-error')}">
        <label for="description">
            <g:message code="file.description.label" default="Description" />
        </label>
        <g:textField name="description" class="form-control" value="${fileInstance?.description}"/>
    </div>
    <div class="col-xs-8 form-group container-date">
        <div class="col-xs-6 form-group">
            <label for="periodInit">
                <g:message code="file.periodInit.label" />
            </label>
            <input id="periodInitDate" name="periodInitDate" type="text" class="mask-date date-picker form-control" placeholder="${message (code: "file.periodInit.label")}" value="<g:formatDate date="${fileInstance?.periodInit}" format="${message (code: "default.date.format")}" />" />
        </div>
        <div class="col-xs-6 form-group">
            <label for="periodEnd">
                <g:message code="file.periodEnd.label" />
            </label>
            <input id="periodEndDate" name="periodEndDate" type="text" class="mask-date date-picker form-control" placeholder="${message (code: "file.periodEnd.label")}" value="<g:formatDate date="${fileInstance?.periodEnd}" format="${message (code: "default.date.format")}" />" />
        </div>
    </div>
    <div class="col-xs-8 form-group ${hasErrors(bean: fileInstance, field: 'note', 'has-error')}">
        <label for="note">
            <g:message code="file.note.label" default="Note" />
        </label>
        <g:textArea name="note" class="form-control" rows="5" cols="40" value="${fileInstance?.note}"/>
    </div>
    <g:hiddenField name="owner" value="${sec.loggedInUserInfo(field:'username')}" />
</div>




