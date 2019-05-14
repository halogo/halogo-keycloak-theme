<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title" || section = "header">
        ${msg("sms-auth.title")}
    <#elseif section = "subtitle">
        ${msg("sms-auth.instruction")}
    <#elseif section = "form">
        <form id="kc-totp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="smsCode" class="${properties.kcLabelClass!}">${msg("sms-auth.code")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="smsCode" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('smsCode',properties.kcFormGroupErrorClass)}" name="smsCode" placeholder="${msg('sms-auth.code')}" autocomplete="false" />
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg('doSubmit')}"/>
                    <input type="submit" name="resend" value="${msg('didntReceiveCode')}" class="btn btn-link" />
                    <input type="submit" name="update_mobile" value="${msg('changeMobileNumber')}" class="btn btn-link" />
                </div>
            </div>
        </form>
        <#if client?? && client.baseUrl?has_content>
            <p><a id="backToApplication" href="${client.baseUrl}">${msg("backToApplication")}</a></p>
        </#if>
    </#if>
</@layout.registrationLayout>
