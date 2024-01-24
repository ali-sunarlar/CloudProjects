#Created an Azure VM with a system-assigned managed identity.
#Granted permissions to a managed identity.
#Verified a managed identity access token.
#Removed permissions from a managed identity.


$response = Invoke-WebRequest -Uri 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/' -Method GET -Headers @{Metadata="true"}
$content = $response.Content | ConvertFrom-Json
$ArmToken = $content.access_token
(Invoke-WebRequest -Uri https://management.azure.com/subscriptions/4a5a6077-91a6-4b7a-ae62-a2ed402b1a70/resourceGroups/corp-datalod37241878?api-version=2016-06-01 -Method GET -ContentType "application/json" -Headers @{ Authorization ="Bearer $ArmToken"}).content

(Invoke-WebRequest -Uri https://management.azure.com/subscriptions/4a5a6077-91a6-4b7a-ae62-a2ed402b1a70/resourceGroups/corp-datalod37241878?api-version=2016-06-01 -Method GET -ContentType "application/json" -Headers @{ Authorization ="Bearer $ArmToken"}).content > output.txt


#output.txt
