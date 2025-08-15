Write-Host "Skrpyt Pobierajacy Update"
Write-Host "Po skonczonej aktualizacji system uruchamia sie ponownie!"
$updatePackage=(Get-Package -Name PSWindowsUpdate).Version

if($updatePackage)
{
    Write-Host "Wykryta Wersja Modułu: "$updatePackage
}
else
{
    Write-Host "Nie wkryto Modulu !"
    Write-Host "Instalacja Modulu"
    Install-Module -Name PSWindowsUpdate -Force
    $updatePackage=(Get-Package -Name PSWindowsUpdate).Version
    Write-Host "Instalacja Przebiegla Pomyslnie: "$updatePackage 
}


Write-Host "Lista Dostepnych Aktualizacji!"

Get-WindowsUpdate

Write-Host "Rozpoczac Update? (Y/N)"

$startUpdate = Read-Host

if($startUpdate.ToLower() -eq 'n')
{
    Write-Host "Zakonczono przez uzytkownika!"
    exit
}
Write-Host "Rozpocznam Pobiernie"
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot