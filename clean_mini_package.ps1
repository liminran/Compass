# 删除旧的包目录
$oldPackageDir = "app\src\main\java\com\mini\compass"

# 检查目录是否存在
if (Test-Path $oldPackageDir) {
    Write-Host "Deleting old package directory: $oldPackageDir"
    Remove-Item -Path $oldPackageDir -Recurse -Force
    Write-Host "Old package directory deleted"
} else {
    Write-Host "Old package directory does not exist: $oldPackageDir"
}

Write-Host "Cleanup completed!" 