
# Startup message
$CurUser = (Get-ChildItem Env:\USERNAME).Value

# Dynamic greeting based on current time or luck:
$CurTime = Get-Date -UFormat "%R"
if ($CurTime -le 12) {
  $Greeting = "Good morning, "
}
elseif ($CurTime -gt 12 -and $CurTime -le 19) {
  $Greeting = "Good afternoon, "
}
elseif ($CurTime -gt 19 -or $CurTime -le 3) {
  $Greeting = "Good evening, "
}
$num = Get-Random -Maximum 100
if($num -eq 69 ) {
  $Greeting = "Go fuck yourself, "
}
Write-Host "Launching Windows PowerShell..."

# Load own custom functions at startup
$functions = "$env:USERPROFILE\custom-functions-ps"

Write-Host "Loaded custom functions." -ForegroundColor Green
Get-ChildItem "$functions\*.ps1" | %{.$_}

Write-Host -NoNewLine $Greeting
Write-Host "$CurUser" -ForegroundColor Blue
Write-Host ''

#Custom prompt
function Prompt {

Write-Host -NoNewline "pwsh "
Write-Host -NoNewLine "$((Get-Location).Path)" -ForegroundColor Blue
Write-Host -NoNewLine " ~> " -ForegroundColor Red

$host.UI.RawUI.WindowTitle = "pwsh >> Current DIR: $((Get-Location).Path)"

Return " "

}


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-Alias -Name ipconfig -Value Get-NetIPConfiguration


