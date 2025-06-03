# 删除旧的包目录
$oldPackageDir = "app\src\main\java\com\bobek\compass"

# 检查目录是否存在
if (Test-Path $oldPackageDir) {
    Write-Host "删除旧的包目录: $oldPackageDir"
    Remove-Item -Path $oldPackageDir -Recurse -Force
    Write-Host "旧包目录已删除"
} else {
    Write-Host "旧包目录不存在: $oldPackageDir"
}

# 检查是否有错误的路径结构
$wrongPath = "app\src\main\java\com\mini\compass\Android\Compass\app\src\main\java\com\bobek\compass"
if (Test-Path $wrongPath) {
    Write-Host "删除错误路径: $wrongPath"
    Remove-Item -Path $wrongPath -Recurse -Force
    Write-Host "错误路径已删除"
} else {
    Write-Host "错误路径不存在: $wrongPath"
}

Write-Host "清理完成!" 