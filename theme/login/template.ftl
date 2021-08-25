<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>Sign In | dot.base</title>

    <link rel="icon" href="${url.resourcesPath}/img/favicons/favicon.ico" />
    <link rel="icon" type="image/png" sizes="32x32" href="${url.resourcesPath}/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${url.resourcesPath}/img/favicons/favicon-16x16.png">
    <link rel="apple-touch-icon" href="${url.resourcesPath}/img/favicons/apple-touch-icon.png">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content=".base">
    <link rel="mask-icon" href="${url.resourcesPath}/img/favicons/safari-pinned-tab.svg" color="#ffffff">
    <meta name="msapplication-TileImage" content="${url.resourcesPath}/img/favicons/mstile-150x150.png">
    <meta name="msapplication-TileColor" content="#ffffff">

    <link href="${url.resourcesPath}/css/fontawesome.min.css" type='text/css' rel="stylesheet" />
    <link href="${url.resourcesPath}/css/fontawesome-solid.min.css" type='text/css' rel="stylesheet" />
    <link href="${url.resourcesPath}/css/bulma.min.css" type='text/css' rel="stylesheet" />
    
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body>
  <div class="login-form">

    <div class="mx-6 my-5 ${properties.kcHeaderClass!}">
      <h1 class="title">Welcome to move.base!</h1>
      <h2 class="subtitle">Enter your credentials to sign in or register as a new user. If you have problems logging in, <a href="mailto:movebase@charite.de">drop us a message</a>.</h2>
      <div class="logos">
          <img src="${url.resourcesPath}/img/charite-logo.svg" />
      </div>
    </div>

    <div class="mx-6 my-5 sign-in-form">
      <div id="kc-content">
        <div id="kc-content-wrapper">

          <#-- App-initiated actions should not see warning messages about the need to complete the action -->
          <#-- during login.                                                                               -->
          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="alert alert-${message.type}">
                  <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                  <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                  <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                  <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
              </div>
          </#if>

          <#nested "form">

          <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
          <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post" <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
              <div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                  <div class="${properties.kcFormGroupClass!}">
                    <input type="hidden" name="tryAnotherWay" value="on" />
                    <a href="#" id="try-another-way" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                  </div>
              </div>
          </form>
          </#if>

          <#if displayInfo>
              <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      <#nested "info">
                  </div>
              </div>
          </#if>
        </div>
      </div>

    </div>
  </div>
</body>
</html>
</#macro>