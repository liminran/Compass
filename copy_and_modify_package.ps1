# 复制文件并修改包名
$sourceDir = "app\src\main\java\com\mini\compass"
$targetDir = "app\src\main\java\com\waxiaoxia001\compass"

# 确保目标目录存在
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null

# 复制所有文件和目录
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
    $content = Get-Content -Path $_.FullName -Raw -Encoding UTF8
    
    # 替换包名
    $newContent = $content -replace "package com\.mini\.compass", "package com.waxiaoxia001.compass"
    $newContent = $newContent -replace "import com\.mini\.compass", "import com.waxiaoxia001.compass"
    
    # 写入新文件
    Set-Content -Path $targetFile -Value $newContent -Encoding UTF8
    
    Write-Host "Copied and modified: $($_.Name) -> $targetFile"
}

Write-Host "Done!" 