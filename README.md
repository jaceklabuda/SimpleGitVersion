# SimpleGitVersion

Simple version calculation without additional installers and other dependencies.

## Usage

```powershell
$version = Calculate-Version -preRelease alpha -preReleaseNumber 2
## 2.2.0-alpha.2
```

## Benefits

- Simple option to get your last tag.
- Simple pre-release calculation based on last tag.
- No dependencies to install. Only one function to copy in final script.

## Motivation

- Automatic version calculation is very useful for CI/CD processes, when release should be specified for many environment without manual intervention.
- Previously I've used popular tool for calculation, but sometimes it caused problems in use (like too long paths or missing relative branches).
- This project it's a simple solution for simple calcuation of version when advanced possibilies it's not needed.

## Compatibility

- Ready to use with GitLab CI/CD.
- Tested on Windows and Powershell 7.

## Limitation

- No validation of SemVer. Last tag is recognized as correct version.
- Hardcoded prefix `[v*]` of version.
- Only one tag per commit.
- No pre-release number calculation. It should be specidied e.g. by build server.

## Next steps

- SemVer strict mode.
- More possibilities to define parts of veresion based on SemVer.
- More capabilities. Not only Powershell and Windows ;).
- More tests and case studies.
- Possible implementation with other scripting languages.

---

Inspired ❤️ [GitVersion] [SemVer]

[GitVersion]: https://github.com/GitTools/GitVersion
[SemVer]: https://semver.org/