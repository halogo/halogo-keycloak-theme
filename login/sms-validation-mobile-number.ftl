<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("changeMobileNumber", realm.name)}
    <#elseif section = "subtitle">
        ${msg("mobileHelp")}
    <#elseif section = "header">
        ${msg("changeMobileNumber", realm.name)}
    <#elseif section = "form">
        <form id="kc-totp-login-form" class="${properties.kcFormClass!} govuk-grid-column-two-thirds" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="mobile_number" class="${properties.kcLabelClass!}">${msg("phoneNumber")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="mobile_number" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('mobile_number',properties.kcFormGroupErrorClass)}" name="mobile_number" placeholder="${msg('phoneNumber')}" autocomplete="false" value="${mobile_number!''}" />
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg('doSubmit')}"/>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
