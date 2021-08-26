<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("termsTitle")}
    <#elseif section = "form">
    <div id="kc-terms-text">
        <div class="terms-text">
            <#include "/resources/terms-content.ftl">
        </div>
    </div>
    <form class="form-actions" action="${url.loginAction}" method="POST">
        <input class="button ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="accept" id="kc-accept" type="submit" value="${msg("doAccept")}"/>
        <input class="button name="cancel" id="kc-decline" type="submit" value="${msg("doDecline")}"/>
    </form>
    </#if>
</@layout.registrationLayout>