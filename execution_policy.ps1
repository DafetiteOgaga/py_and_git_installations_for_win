# Get the current execution policy
$executionPolicy = Get-ExecutionPolicy

Write-Host ""
Write-Host "...................................................."
Write-Host "Checkinig and setting ExecutionPolicy to Bypass or AllSigned..."
Write-Host "...................................................."
# Check the current execution policy
if ($executionPolicy -eq "Restricted") {
    Write-Host "The current execution policy is Restricted. Setting the execution policy to AllSigned..."
    Set-ExecutionPolicy AllSigned
} elseif ($executionPolicy -eq "Bypass") {
    Write-Host "The current execution policy is Bypass. Setting the execution policy to Bypass -Scope Process..."
    Set-ExecutionPolicy Bypass -Scope Process
} else {
    Write-Host "The current execution policy is already set to AllSigned or Bypass -Scope Process."
}

Write-Host ""
Write-Host "...................................................."
Write-Host "Installing the Chocolatey package manager..."
Write-Host "...................................................."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Host ""
Write-Host "...................................................."
Write-Host "Installing git..."
Write-Host "...................................................."
choco install git

Write-Host ""
Write-Host "...................................................."
Write-Host "Confirming that git is successfully installed..."
Write-Host "...................................................."
git --version

Read-Host "Press Enter to clean-up and exit..."

cd..
Remove-Item -Path "py_and_git_installations_for_win" -Recurse -Force
