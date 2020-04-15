[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', 'porterCredential')]
param
(
    [ValidateNotNullOrEmpty()]
    [ValidateScript({Test-Path playbook/environments/$_})]
    [string] $environmentName = "example",

    [ValidateNotNullOrEmpty()]
    [string] $porterCredential,

    [string] $sshPrivateKey,

    [string] $sshPublicKey,

    [ValidateSet("install","upgrade","uninstall", ignorecase=$true)]
    [string] $action = "install",

    [switch] $skipBuild
)

$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $PSCommandPath

function validateFileParameterWithDefault($value, $default)
{
    if ([string]::IsNullOrEmpty($value))
    {
        $value = $default
    }

    if ( !(Test-Path $value) )
    {
        Write-Error ("File not found: {0}" -f $value)
    }
    else
    {
        return $value
    }
}

$sshPrivateKey = validateFileParameterWithDefault $sshPrivateKey ([IO.Path]::Combine($here, 'playbook', 'environments', 'example_sshkey_id'))
$sshPublicKey = validateFileParameterWithDefault $sshPublicKey ([IO.Path]::Combine($here, 'playbook', 'environments', 'example_sshkey_id.pub'))

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

if (Test-Path $sshPublicKey)
{
    # Assume we have been given a path to a keyfile
    Write-Host "Reading 'ssh_public_key' from file: $sshPublicKey"    
    $sshPublicKey = Get-Content -Raw $sshPublicKey
}

# Store the SSH keyfile contents in the environment variable expected by the example credential file
$env:SSH_PRIVATE_KEY_BASE64 = $sshPrivateKeyBase64

Write-Host "***************" -ForegroundColor Green
Write-Host "** Target Env: $environmentName" -ForegroundColor Green
Write-Host "** Credential: $porterCredential" -ForegroundColor Green
Write-Host "***************" -ForegroundColor Green
porter $action --param environment_name=$environmentName `
               --param ssh_public_key=$sshPublicKey `
               --cred $porterCredential

Pop-Location
