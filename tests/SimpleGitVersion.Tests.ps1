Describe "Clean" {
    It "does something useful" {
        $version = Calculate-Version -preRelease alpha -preReleaseNumber 2
        $version | Should -Be '1.0.0'
    }
}