###
# Sample usage
###

. ./SimpleGitVersion.ps1

$version = Calculate-Version -preRelease alpha -preReleaseNumber 2 -autoIncrementLevel minor

Write-Host $version


$version = Calculate-Version -preRelease alpha -preReleaseNumber 2 -autoIncrementLevel major

Write-Host $version