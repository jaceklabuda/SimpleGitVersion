function Calculate-Version
{
	[CmdletBinding()] 
    Param 
    ( 
        [Parameter(Mandatory=$false)]
        [string]$prefix,
        [Parameter(Mandatory=$false)]
        [string]$preRelease,        
        [Parameter(Mandatory=$false)] 
		[string]$preReleaseNumber,        
        [Parameter(Mandatory=$false)] 
		[string]$autoIncrementLevel
    )
	Process
	{
        $version = '0.1.0'
        $command = 'git describe --match "$prefix*" --abbrev=0 --tags --exclude "*-*" $(git rev-list --tags --max-count=1)'

        $result = Invoke-Expression $command
        
        if ($result.length -ne 0)
        {
            $version = $result
        } 
        
        if ($prefix.length -ne 0)
        {
            $version = $version.replace($prefix, '')
        }        

        if ($result.length -ne 0 -and $autoIncrementLevel.length -ne 0)
        {
            $major,$minor,$patch = $version.Split('.')

            if ($autoIncrementLevel -eq 'major')
            {
                $major = 1 + $major
                $minor = 0
                $patch = 0
            }

            if ($autoIncrementLevel -eq 'minor')
            {
                $minor = 1 + $minor
                $patch = 0
            }
            
            if ($autoIncrementLevel -eq 'patch')
            {
                $patch = 1 + $patch
            }

            $version = "$major.$minor.$patch"
        }

        if ($preRelease.length -ne 0)
        {
            $version = "$version-$preRelease.$preReleaseNumber" 
        } 

        return $version
	}
}
