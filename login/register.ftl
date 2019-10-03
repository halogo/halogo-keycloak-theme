<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "subtitle">
        ${msg("registerWithSubTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "back">
        <a class="link-back" href="${url.loginUrl}">${msg("backToLogin")}</a>
    <#elseif section = "form">
        <div class="alert alert-danger" role="alert" tabindex="-1" id="terms_and_conditions_error" style="display:none">
            ${msg('termsAndCondistionsError')}
        </div>
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
          <input type="text" readonly value="this is not a login form" style="display: none;">
          <input type="password" readonly value="this is not a login form" style="display: none;">
            <div id="kc-login-details">
                <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${msg("createUsername")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}" name="username" value="${(register.formData.username!'')}" placeholder="${msg('createUsername')}" />
                    </div>
                </div>
                </#if>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="email" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}" name="email" value="${(register.formData.email!'')}" placeholder="${msg('email')}" />
                    </div>
                </div>
                <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("createPassword")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass)}" name="password" placeholder="${msg('createPassword')}" />
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password-confirm" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}" name="password-confirm" placeholder="${msg('passwordConfirm')}" />
                    </div>
                </div>
                </#if>

                <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
                </#if>

                <div class="form-group">
                    <input type="checkbox" name="user.attributes.terms_and_conditions" id="terms_and_conditions" /> ${msg('termsAndCondistionsAgree')?no_esc}
                    <script>
                        var terms_and_conditions = "${register.formData['user.attributes.terms_and_conditions']!''}";
                        if(terms_and_conditions) {
                            $("#terms_and_conditions").prop('checked', true);
                        } else {
                            $("#terms_and_conditions").val(Date.now());
                        }

                        $('#kc-register-form').submit(function() {
                            if ($('#terms_and_conditions', this).is(':checked')) {
                                return true;
                            } else {
                                $('.alert').css("display", "none");
                                $('#terms_and_conditions_error').css("display", "block");
                                return false;
                            }
                        });
                    </script>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
