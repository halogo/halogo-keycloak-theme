<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html>

<#-- Attempt to reverse-engineer code for page’s current language, as Keycloak does not currently make this available -->
<#assign LANG_CODE = "en">
<#if .locale??>
    <#assign LANG_CODE = .locale>
</#if>
<#if locale??>
    <#list locale.supported>
        <#items as supportedLocale>
            <#if supportedLocale.label == locale.current>
                <#if supportedLocale.url?contains("?kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after("?kc_locale=")[0..1]>
                </#if>
                <#if supportedLocale.url?contains("&kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after("&kc_locale=")[0..1]>
                </#if>
            </#if>
        </#items>
    </#list>
</#if>

<!--[if lt IE 9]><html class="lte-ie8 ${properties.kcHtmlClass!}" lang="${LANG_CODE}"><![endif]-->
<!--[if gt IE 8]><!--><html class="${properties.kcHtmlClass!}" lang="${LANG_CODE}"><!--<![endif]-->

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"> - ${realm.displayName!'HaloGo'}</title>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <link rel="shortcut icon" href="${url.resourcesPath}/vendor/govuk_template/images/favicon.ico?0.22.1" type="image/x-icon" />
    <link rel="mask-icon" href="${url.resourcesPath}/vendor/govuk_template/images/gov.uk_logotype_crown.svg?0.22.1" color="#0b0c0c">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-152x152.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-120x120.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-76x76.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-60x60.png?0.22.1">

    <meta property="og:image" content="${url.resourcesPath}/vendor/govuk_template/images/opengraph-image.png?0.22.1">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/css-social-buttons/1.3.0/css/zocial.css" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
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

<body class="${properties.kcBodyClass!} d-flex flex-column h-100">
    <#-- Add Template <body> JavaScript class -->
    <script>document.body.className = ((document.body.className) ? document.body.className + ' js-enabled' : 'js-enabled');</script>

    <#-- Start Template header -->
    <header role="banner" id="global-header" >
        <nav class="${properties.kcHeaderClass!}">
            <a href="#" title="HaloGo" id="logo" class="content">
              <img src="${url.resourcesPath}/img/logo-halogo.svg" width="167" height="47" alt="">
            </a>
        </nav>
    </header>

    <div id="global-header-bar"></div>

    <main id="main" role="main" class="flex-shrink-0">
        <div class="container">
            <div><#nested "back"></div>

            <div class="row justify-content-center">
                <div class="col">
                    <h1 class="h3 mb-3 font-weight-normal"><#nested "title"></h1>
                    <h2 class="h5 mb-3 font-weight-normal"><#nested "subtitle"></h2>

                    <div id="kc-container" class="${properties.kcContainerClass!}">
                        <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">

                            <#if realm.internationalizationEnabled>
                                <div id="kc-locale" class="${properties.kcLocaleClass!}">
                                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                                        <div class="kc-dropdown" id="kc-locale-dropdown">
                                            <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                            <ul>
                                                <#list locale.supported as l>
                                                    <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                                </#list>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </#if>

                            <div id="kc-content" class="${properties.kcContentClass!}">
                                <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">

                                    <#if displayMessageImportant!true != false >
                                        <#if displayMessage && message?has_content>
                                            <#if message.type = 'error'>
                                                <div class="alert alert-danger" role="alert" tabindex="-1">
                                                    ${message.summary?no_esc}
                                                </div>
                                            <#else>
                                                <div class="${properties.kcFeedbackAreaClass!}">
                                                    <div class="alert alert-${message.type}"><p>
                                                        <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                                        <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                                        <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                                        <span class="kc-feedback-text">${message.summary}</span></p>
                                                    </div>
                                                </div>
                                            </#if>
                                        </#if>
                                    </#if>

                                    <div id="kc-form" class="${properties.kcFormAreaClass!}">
                                        <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                                            <#nested "form">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <#if displayInfo>
                        <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                            <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </main>

    <footer class="footer mt-auto py-3">
      <div class="container">
        <a href="#">&copy; 2019 HaloGo</a>
      </div>
    </footer>

    <script>
        var origin = window.location.origin;
        var r = /https?:\/\/(staging|uat)\.auth\.halogo\.io/;
        var groups = origin.match(r).groups;
        if(groups.env) {
            $(document.body).append('<h2>' + groups.env + '</h2');
        }
    </script>

    <div id="global-app-error" class="app-error hidden"></div>

</body>
</html>
</#macro>
