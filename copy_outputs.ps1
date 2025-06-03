# 创建输出目录
$outputDir = "outputs"
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
}

# 复制APK文件
$apkPath = "app\build\outputs\apk\release\app-release.apk"
if (Test-Path $apkPath) {
    Copy-Item -Path $apkPath -Destination "$outputDir\mini-compass-release.apk"
    Write-Host "APK file copied to: $outputDir\mini-compass-release.apk"
} else {
    Write-Host "APK file not found: $apkPath"
}

# 复制AAB文件
$aabPath = "app\build\outputs\bundle\release\app-release.aab"
if (Test-Path $aabPath) {
    Copy-Item -Path $aabPath -Destination "$outputDir\mini-compass-release.aab"
    Write-Host "AAB file copied to: $outputDir\mini-compass-release.aab"
} else {
    Write-Host "AAB file not found: $aabPath"
}

# 复制Debug APK文件
$debugApkPath = "app\build\outputs\apk\debug\app-debug.apk"
if (Test-Path $debugApkPath) {
    Copy-Item -Path $debugApkPath -Destination "$outputDir\mini-compass-debug.apk"
    Write-Host "Debug APK file copied to: $outputDir\mini-compass-debug.apk"
} else {
    Write-Host "Debug APK file not found: $debugApkPath"
}

Write-Host "Done!" 