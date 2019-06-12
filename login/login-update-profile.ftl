<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("profileWithTitle",(realm.displayName!''))}
    <#elseif section = "subtitle">
        ${msg("profileWithSubTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}" name="firstName" value="${(user.firstName!'')}" placeholder="${msg('firstName')}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}" name="lastName" value="${(user.lastName!'')}" placeholder="${msg('lastName')}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.mobile_number" class="${properties.kcLabelClass!}">${msg("mobile")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="hidden" id="user.attributes.mobile_number" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('user.attributes.mobile_number',properties.kcFormGroupErrorClass!)}" name="user.attributes.mobile_number" value="${(user.attributes.mobile_number!'')}" placeholder="${msg('mobile')}" />
                    <div class="mobile-number-flex-container">
                        <div class="mobile-number-prefix-container">
                            <div class="select-container">
                                <select class="form-control mobile-number-prefix" name="mobile_prefix" onchange="updateMobileNumber()">
                                    <option value="+61">+61</option>
                                    <option value="+64">+64</option>
                                    <option value="+65">+65</option>
                                </select>
                            </div>
                        </div>
                        <div class="mobile-number-container">
                            <input type="text" class="form-control mobile-number" name="mobile_number" value="" placeholder="Mobile number" onkeyup="updateMobileNumber()" />
                        </div>
                    </div>
                    <small id="emailHelp" class="form-text text-muted">${msg("mobileHelp")}</small>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.postcode" class="${properties.kcLabelClass!}">${msg("postcode")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="user.attributes.postcode" class="${properties.kcInputClass!} ${messagesPerField.printIfExists('user.attributes.postcode',properties.kcFormGroupErrorClass!)}" name="user.attributes.postcode" value="${(user.attributes.postcode!'')}" placeholder="${msg('postcode')}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>