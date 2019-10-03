<#include "header.ftl">
${kcSanitize(msg("eventUpdateTotpBodyHtml",event.date, event.ipAddress))?no_esc}
<#include "footer.ftl">
