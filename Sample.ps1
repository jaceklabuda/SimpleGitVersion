###
# Sample usage
###

. ./SimpleGitVersion.ps1

$version = Calculate-Version -preRelease alpha -preReleaseNumber 2

Write-Host $version