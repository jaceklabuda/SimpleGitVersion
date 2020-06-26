function Calculate-Version
{
	[CmdletBinding()] 
    Param 
    ( 
        [Parameter(Mandatory=$false)] 
        [ValidateNotNullOrEmpty()]
        [string]$preRelease,        
        [Parameter(Mandatory=$false)] 
        [ValidateNotNullOrEmpty()]
		[string]$preReleaseNumber
    )
	Process
	{
		$prefix = 'v'
        $version = '0.1.0'

        $command = 'git describe --match "v*" --abbrev=0 --tags --exclude "*-*" $(git rev-list --tags --max-count=1)'

        $result = Invoke-Expression $command

        if ($result.length -ne 0)
        {
            $version = $result.replace($prefix, '')
        }

        if ($preRelease.length -ne 0)
        {
            $version = "$version-$preRelease.$preReleaseNumber" 
        } 

        return $version
	}
}
