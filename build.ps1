$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $true

$buildDir = "build"
if (Test-Path $buildDir) {
	Write-Host -ForegroundColor Green "Removing old build dir..."
	Remove-Item $buildDir -Force -Recurse
}

New-Item $buildDir -ItemType Directory | Out-Null
try {
	Push-Location $buildDir

	Write-Host -ForegroundColor Green "CMake - Generating..."
	cmake.exe ../

	Write-Host -ForegroundColor Green "CMake - Building..."
	cmake.exe --build . --config Debug --target VkLayer_khronos_validation
	# cmake.exe --build . --target help
}
finally {
	Pop-Location
}
