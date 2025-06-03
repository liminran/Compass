# 更新布局文件中的包名引用
$layoutDir = "app\src\main\res\layout"

# 处理所有布局文件
Get-ChildItem -Path $layoutDir -Filter "*.xml" -Recurse | ForEach-Object {
    # 读取文件内容
    $content = Get-Content -Path $_.FullName -Raw
    
    # 替换包名引用
    $newContent = $content -replace "com\.bobek\.compass", "com.mini.compass"
    
    # 写入文件
    Set-Content -Path $_.FullName -Value $newContent
    
    Write-Host "Updated layout file: $($_.Name)"
}

# 更新navigation文件
$navDir = "app\src\main\res\navigation"
if (Test-Path $navDir) {
    Get-ChildItem -Path $navDir -Filter "*.xml" -Recurse | ForEach-Object {
        # 读取文件内容
        $content = Get-Content -Path $_.FullName -Raw
        
        # 替换包名引用
        $newContent = $content -replace "com\.bobek\.compass", "com.mini.compass"
        
        # 写入文件
        Set-Content -Path $_.FullName -Value $newContent
        
        Write-Host "Updated navigation file: $($_.Name)"
    }
}

Write-Host "Done!" 