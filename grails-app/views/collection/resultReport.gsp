<!DOCTYPE html>
<html>
    <head>
        <title><g:message code="collection.result-report.label" /></title>
        <r:require module="bootstrap"/>
        <r:require module="resultReport"/>
        <r:layoutResources/>
    </head>
    <body>
        <div class="report-wrapper">
            <div class="header">
                <div class="logo-header">
                    <g:img dir="images" file="maac-logo.jpg" />
                </div>
                <h3><g:message code="collection.result-report.label" /></h3>
            </div>
            <div class="content">
                <g:if test="${params.detail}">
                    <table align="center" class="table" cellpadding="5" cellspacing="0">
                        <thead>
                            <tr>
                                <td width="80px"><g:message code="collection.code.label" /></td>
                                <td width="250px"><g:message code="collection.name.label" /></td>
                                <td width="150px"><g:message code="collection.library.label" /></td>
                                <td><g:message code="collection.note.label" /></td>
                                <td width="100px" class="center"><g:message code="default.owner.label" /></td>
                                <td width="120px" class="center"><g:message code="default.dateCreated.label" /></td>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${collectionInstanceList}" status="i" var="collectionInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${fieldValue(bean: collectionInstance, field: "code")}</td>
                                    <td>${fieldValue(bean: collectionInstance, field: "name")}</td>
                                    <td>${fieldValue(bean: collectionInstance, field: "library.name")}</td>
                                    <td>${fieldValue(bean: collectionInstance, field: "note")}</td>
                                    <td class="center">${fieldValue(bean: collectionInstance, field: "owner")}</td>
                                    <td class="center small"><g:formatDate date="${collectionInstance.dateCreated}" format="${message (code: "default.datetime.format")}" /></td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </g:if>
                <g:else>
                    <table align="center" class="table" cellpadding="5" cellspacing="0">
                        <thead>
                          <tr>
                            <td width="80px"><g:message code="collection.code.label" /></td>
                            <td width="300px"><g:message code="collection.name.label" /></td>
                            <td width="200px"><g:message code="collection.library.label" /></td>
                            <td><g:message code="collection.note.label" /></td>
                          </tr>
                        </thead>
                        <tbody>
                            <g:each in="${collectionInstanceList}" status="i" var="collectionInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${fieldValue(bean: collectionInstance, field: "code")}</td>
                                    <td>${fieldValue(bean: collectionInstance, field: "name")}</td>
                                    <td>${fieldValue(bean: collectionInstance, field: "library.name")}</td>
                                    <td>${fieldValue(bean: collectionInstance, field: "note")}</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </g:else>
                <div class="legend"><g:message code="default.listSize.legend" /> ${collectionInstanceList.size()}</div>
            </div>
            <div class="footer">
                <div class="footer-right">
                    <sec:username />, <g:formatDate date="${new Date()}" format="${message (code: "default.datetime.format")}" />
                    <br />
                    <span class="print-button glyphicon glyphicon-print" onclick="javascript:window.print()"></span>
                </div>
            </div>
        </div>
    </body>
    <r:layoutResources/>
</html>
