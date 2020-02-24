param
(
    [ValidateNotNullOrEmpty()]
    [ValidateScript({Test-Path playbook/environments/$_})]
    [string] $environmentName = "example",

    [ValidateNotNullOrEmpty()]
    [ValidateScript({Test-Path $_})]
    [string] $credentialFile = "$(Split-Path -Parent $PSCommandPath)/porter-example-creds.yml",

    [ValidateNotNullOrEmpty()]
    [string] $sshPrivateKey = "$(Split-Path -Parent $PSCommandPath)/playbook/environments/example_sshkey_id",

    [ValidateSet("install","upgrade","uninstall", ignorecase=$true)]
    [string] $action = "install",

    [switch] $skipBuild
)

$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $PSCommandPath

if ( !(Test-Path env:AZURE_SECRET) )
{
    Write-Error "You must preload your shell with the required environment variables for Azure SPN authentication:`n`tAZURE_CLIENT_ID`n`tAZURE_SECRET`n`tAZURE_SUBSCRIPTION_ID`n`tAZURE_TENANT"
}

Push-Location $here
if (!$skipBuild)
{
    porter build
    if ($LASTEXITCODE -ne 0)
    {
        Write-Error "There was an error whilst trying to build the Porter bundle, check preceding output"
    }
}

# Prepare SSH private key for use as Porter credential
if (Test-Path $sshPrivateKey)
{
    # Assume we have been given a path to a keyfile
    Write-Host "Reading 'ssh_private_key' from file: $sshPrivateKey"    
    $sshPrivateKeyBase64 = [Convert]::ToBase64String([System.Text.Encoding]::Utf8.GetBytes($(Get-Content -Raw $sshPrivateKey)))
}
else
{
    # Assume we have been passed an keyfile in Base64 form
    Write-Host "Reading 'ssh_private_key' as Base64 parameter"
    $sshPrivateKeyBase64 = $sshPrivateKey
}

# Try to validate that the Base64 keyfile is valid
$sshKeyToValidate = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($sshPrivateKeyBase64))
if ( -not $sshKeyToValidate.StartsWith("-----BEGIN") )
{
    Write-Error "The provided SSH private key information does not seem to be valid"
}

# Store the SSH keyfile contents in the environment variable expected by the example credential file
$env:SSH_PRIVATE_KEY_BASE64 = $sshPrivateKeyBase64

Write-Host "***************" -ForegroundColor Green
Write-Host "** Target Env: $environmentName" -ForegroundColor Green
Write-Host "** Credential: $credentialFile" -ForegroundColor Green
Write-Host "***************" -ForegroundColor Green
porter $action --param environment_name=$environmentName --cred $credentialFile

Pop-Location
