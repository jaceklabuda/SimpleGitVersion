Describe "Calculate-Version" {
    BeforeAll {      
        . .\SimpleGitVersion.ps1

        $versionLatest = git describe --tags $(git rev-list --tags --max-count=1)
        $major,$minor,$patch = $versionLatest.Split('.')
    }    
    
    It "returns default version when specified format by with prefix doesn't exist" {
        Calculate-Version -prefix unknown | Should -Be "0.1.0"
    }
    
    It "returns current version" {
        Calculate-Version | Should -Be "$major.$minor.$patch"
    }
    
    It "returns incremented major of version" {
        $major = 1 + $major;
        $minor = 0;
        $patch = 0;

        Calculate-Version -autoIncrementLevel major | Should -Be "$major.$minor.$patch"
    }
    
    It "returns incremented minor of version" {
        $minor = 1 + $minor;
        $patch = 0;

        Calculate-Version -autoIncrementLevel minor | Should -Be "$major.$minor.$patch"
    }
    
    It "returns inrecement patch of version" {
        $patch = 1 + $patch;

        Calculate-Version -autoIncrementLevel patch | Should -Be "$major.$minor.$patch"
    }

    It "returns version as prerelease with incremented major and alpha.1" {
        $version = Calculate-Version -preRelease alpha -preReleaseNumber 1  -autoIncrementLevel major
        $major = 1 + $major;
        $minor = 0;
        $patch = 0;
        
        $version | Should -Be "$major.$minor.$patch-alpha.1"
    }

    It "returns version as prerelease with incremented minor and alpha.1" {
        $version = Calculate-Version -preRelease alpha -preReleaseNumber 1 -autoIncrementLevel minor
        $minor = 1 + $minor;
        $patch = 0;
        
        $version | Should -Be "$major.$minor.$patch-alpha.1"
    }

    It "returns version as prerelease with incremented patch and alpha.1" {
        $version = Calculate-Version -preRelease alpha -preReleaseNumber 1 -autoIncrementLevel patch
        $patch = 1 + $patch;
        
        $version | Should -Be "$major.$minor.$patch-alpha.1"
    }
}
