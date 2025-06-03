# 创建输出目录
$outputDir = "outputs"
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
}

# 复制APK文件
$apkPath = "app\build\outputs\apk\release\app-release.apk"
if (Test-Path $apkPath) {
    Copy-Item -Path $apkPath -Destination "$outputDir\waxiaoxia001-compass-release.apk"
    Write-Host "APK file copied to: $outputDir\waxiaoxia001-compass-release.apk"
} else {
    Write-Host "APK file not found: $apkPath"
}

# 复制AAB文件
$aabPath = "app\build\outputs\bundle\release\app-release.aab"
if (Test-Path $aabPath) {
    Copy-Item -Path $aabPath -Destination "$outputDir\waxiaoxia001-compass-release.aab"
    Write-Host "AAB file copied to: $outputDir\waxiaoxia001-compass-release.aab"
} else {
    Write-Host "AAB file not found: $aabPath"
}

Write-Host "Done!" 