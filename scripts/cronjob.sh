* * * * * curl -s -o /dev/null -w "%{http_code}" http://localhost | grep -v 200 && curl -X POST https://prod-117.westus.logic.azure.com:443/workflows/94da3f6d9db143dba29944d57e4d4906/triggers/When_an_HTTP_request_is_received/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2FWhen_an_HTTP_request_is_received%2Frun&sv=1.0&sig=FG-xSnZcw_ja_pEuISRKplPxhROTiMirhw4xb1AhbDA \
  -H "Content-Type: application/json" \
  -d '{}'
