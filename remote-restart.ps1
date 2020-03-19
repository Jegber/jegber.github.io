$fileLocation = 'C:\Users\e143981\Documents\justin\utils\remote-restart\previous-number.txt'
$webURL = 'https://jegber.github.io'


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$siteResponse = Invoke-WebRequest -Headers @{"Cache-Control"="no-cache"} -Uri $webURL
$siteResponse = $siteResponse.Content -as [int]
echo $siteResponse

$previousNumber = Get-Content -Path $fileLocation
$previousNumber = $previousNumber -as [int]
echo $previousNumber

Set-Content -Path $fileLocation -Value $siteResponse

if ($siteResponse -ne 0 -and $previousNumber -ne $siteResponse) {
  Restart-Computer -Force
  echo 'should restart'
}
