param
(
    [ValidateNotNullOrEmpty()]
    [ValidateScript({Test-Path playbook/environments/$_})]
    [string] $environmentName = "example",

    [ValidateNotNullOrEmpty()]
    [ValidateScript({Test-Path $_})]
    [string] $credentialFile = "$(Split-Path -Parent $PSCommandPath)/porter-example-creds.yml",

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
    # ensure the base image is built
    docker build -t cnab-ansible-base -f Dockerfile.base .
    # build the porter bundle (under linux)
    docker run -it --rm -v "$(pwd):/src" -v "/var/run/docker.sock:/var/run/docker.sock" -w /src cnab-ansible-base porter build
}

Write-Host "***************" -ForegroundColor Green
Write-Host "** Target Env: $environmentName" -ForegroundColor Green
Write-Host "** Credential: $credentialFile" -ForegroundColor Green
Write-Host "***************" -ForegroundColor Green
porter $action --param environment_name=$environmentName --cred $credentialFile
Pop-Location
