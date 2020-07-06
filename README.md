# SimpleGitVersion

Simple version calculation without additional installers and other dependencies.

## Usage

```powershell
$version = Calculate-Version
# 2.1.0

$version = Calculate-Version -autoIncrementLevel minor
# 2.2.0

$version = Calculate-Version -autoIncrementLevel minor -preRelease alpha -preReleaseNumber 2
# 2.2.0-alpha.2
```

## Benefits

- Simple option to get your last tag.
- Simple pre-release calculation based on last tag.
- No dependencies to install. Only one function to copy in final script.
- Support of custom prefixes `[v*]`, `[something-*]` of version.

## Motivation

- Automatic version calculation is very useful for CI/CD processes, when release should be specified for many environment without manual intervention.
- Previously I've used popular tool for calculation, but sometimes it caused problems in use (like too long paths or missing relative branches).
- This project it's a simple solution for simple calcuation of version when advanced possibilies it's not needed.

## Compatibility

- Ready to use with GitLab CI/CD.
- Tested on Windows and Powershell 7.

## Limitation

- No validation of SemVer. Last tag is recognized as correct version.
- Only one tag per commit.
- No pre-release number calculation. It should be specidied e.g. by build server.

## Next steps

- SemVer strict mode.
- More possibilities to define parts of veresion based on SemVer.
- More capabilities. Not only Powershell and Windows ;).
- More case studies.
- Possible implementation with other scripting languages.

## Contribute

If you want to contribute to a project, your help is very welcome.
Please check a page with issues and add new one with your suggestions, then create a fork and start work. When your work will be ready, create a pull request.

## Develop

### Running Tests

#### Running the Unit Test Suite

Tests are write with [Pester] which is a great tool to testing scripts written in PowerShell.
Before start work tests, required is installation Pester's module ([Pester: Installation Guide]);

To run test on PowerShell console run:

```powershell
Invoke-Pester -Script ./SimpleGitVersion.Tests.ps1
```

---

Inspired by ❤️ [SemVer] & [GitVersion]

[GitVersion]: https://github.com/GitTools/GitVersion
[SemVer]: https://semver.org
[Pester]: https://github.com/pester/Pester
[Pester: Installation Guide]: https://pester.dev/docs/introduction/installation