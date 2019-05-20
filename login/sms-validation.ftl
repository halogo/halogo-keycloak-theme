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
                    <input type="hidden" id="smsCode" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('smsCode',properties.kcFormGroupErrorClass)}" name="smsCode" placeholder="${msg('sms-auth.code')}" autocomplete="false" value="0000" />
                    <div class="sms-code-container">
                        <input type="text" id="smsCode_1" class="form-control sms-code" name="smsCode_1" autocomplete="false" onkeyup="onEnterSmsCode(this, 0, 'smsCode_2', event, 'smsCode')" onclick="this.select();" autofocus />
                        <input type="text" id="smsCode_2" class="form-control sms-code" name="smsCode_2" autocomplete="false" onkeyup="onEnterSmsCode(this, 1, 'smsCode_3', event, 'smsCode')" onclick="this.select();" />
                        <input type="text" id="smsCode_3" class="form-control sms-code" name="smsCode_3" autocomplete="false" onkeyup="onEnterSmsCode(this, 2, 'smsCode_4', event, 'smsCode')" onclick="this.select();" />
                        <input type="text" id="smsCode_4" class="form-control sms-code" name="smsCode_4" autocomplete="false" onkeyup="onEnterSmsCode(this, 3, 'smsCode_5', event, 'smsCode')" onclick="this.select();" />
                    </div>
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
