﻿$ErrorActionPreference = 'Stop';

$silentArgs = '/si '
$pp = Get-PackageParameters
if ($pp['dir']) {
    $dir = $pp['dir']
    if (!(Test-Path $dir -IsValid)) {
		Throw "Bad dir parameter"
	}
	$silentArgs = $silentArgs + '/dir=' + $dir + ' '
	}
if ($pp['re']) { $silentArgs = $silentArgs + '/re ' }
if ($pp['st']) { $silentArgs = $silentArgs + '/st ' }
if ($pp['en']) { $silentArgs = $silentArgs + '/en ' }
if ($pp['la']) { $silentArgs = $silentArgs + '/la ' }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  url            = 'https://kurtzimmermann.com/files/RegCool.exe'
  checksum       = 'ba12a9f40d60cc1699bf49a412e03afb0eb99ed74407b17f8c6f13b5a4efd457'
  checksumType   = 'sha256'
  silentArgs     = $silentArgs
  validExitCodes = @(0, 18)
  softwareName   = 'regcool'
  toolsDir       = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
}
Install-ChocolateyPackage @packageArgs
