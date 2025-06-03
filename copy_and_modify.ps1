# 复制文件并修改包名
$sourceDir = "app\src\main\java\com\bobek\compass"
$targetDir = "app\src\main\java\com\mini\compass"

# 确保目标目录存在
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null

# 复制所有文件
Get-ChildItem -Path $sourceDir -Recurse -File | ForEach-Object {
    # 获取相对路径
    $relPath = $_.FullName.Substring($PWD.Path.Length + 1 + $sourceDir.Length + 1)
    $targetFile = Join-Path -Path $targetDir -ChildPath $relPath
    
    # 确保目标目录存在
    $targetFolder = Split-Path -Path $targetFile -Parent
    if (!(Test-Path $targetFolder)) {
        New-Item -ItemType Directory -Force -Path $targetFolder | Out-Null
    }
    
    # 读取文件内容
    $content = Get-Content -Path $_.FullName -Raw
    
    # 替换包名
    $newContent = $content -replace "package com\.bobek\.compass", "package com.mini.compass"
    $newContent = $newContent -replace "import com\.bobek\.compass", "import com.mini.compass"
    
    # 写入新文件
    Set-Content -Path $targetFile -Value $newContent
    
    Write-Host "Copied and modified: $($_.Name) -> $targetFile"
}

Write-Host "Done!" 