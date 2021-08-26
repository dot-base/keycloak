<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <header>
            <h1 class="title mb-5">${msg("registerTitle")}</h1>
        </header>
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-sEmailize="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>
            <div class="field">
                <div class="${properties.kcInputWrapperClass!}">
                  <p class="control has-icons-left has-icons-right">
                    <input class="input" placeholder="Email" tabindex="1" type="text" id="email" class="${properties.kcInputClass!}" name="email"
                           value="${(register.formData.email!'')}" autocomplete="email"
                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />

                    <#if messagesPerField.existsError('email')>
                        <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </span>
                    </#if>
                    <span class="icon is-small is-left">
                        <i class="fas fa-at"></i>
                    </span>
                  </p>
                </div>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="field">
                    <div class="${properties.kcInputWrapperClass!}">
                      <p class="control has-icons-left has-icons-right">
                        <input class="input" placeholder="Username" tabindex="1" type="text" id="username" class="${properties.kcInputClass!}" name="username"
                               value="${(register.formData.username!'')}" autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                        <span class="icon is-small is-left">
                            <i class="fas fa-user"></i>
                        </span>
                      </p>
                    </div>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="field">
                    <div class="${properties.kcInputWrapperClass!}">
                      <p class="control has-icons-left">
                        <input class="input" placeholder="Password" tabindex="1"  type="password" id="password" class="${properties.kcInputClass!}" name="password"
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                        <span class="icon is-small is-left">
                            <i class="fas fa-lock"></i>
                        </span>
                      </p>
                    </div>
                </div>

                <div class="field">
                    <div class="${properties.kcInputWrapperClass!}">
                      <p class="control has-icons-left">
                        <input class="input" placeholder="Confirm Password" tabindex="1"  type="password" id="password-confirm" class="${properties.kcInputClass!}"
                               name="password-confirm"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                        <span class="icon is-small is-left">
                            <i class="fas fa-lock"></i>
                        </span>
                      </p>
                    </div>
                </div>
            </#if>

            <div class="field">
                    <input type="checkbox" required name="checkbox" value="check" id="agree">
                    <span>${msg("agreeStatement")}<a href="${msg("termsUrl")}" target="_blank" rel="noopener noreferrer"> ${msg("terms")}</a></span>
                    </input>
            </div>

            <div class="field">
                <div class="form-options">
                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <input tabindex="4" class="button ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                    </div>
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>