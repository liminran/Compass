# 修复XML文件的编码问题
$xmlDirs = @(
    "app\src\main\res\layout",
    "app\src\main\res\layout-land",
    "app\src\main\res\navigation"
)

foreach ($dir in $xmlDirs) {
    if (Test-Path $dir) {
        Get-ChildItem -Path $dir -Filter "*.xml" -Recurse | ForEach-Object {
            $filePath = $_.FullName
            Write-Host "Processing file: $filePath"
            
            # 读取文件内容
            $content = Get-Content -Path $filePath -Raw
            
            # 删除BOM标记
            $content = $content -replace "^\xEF\xBB\xBF", ""
            
            # 确保XML声明正确
            if ($content -notmatch '^\s*<\?xml') {
                $content = '<?xml version="1.0" encoding="utf-8"?>' + "`r`n" + $content
            }
            
            # 替换包名引用
            $content = $content -replace "com\.mini\.compass", "com.waxiaoxia001.compass"
            
            # 使用UTF8编码写入文件（不带BOM）
            $utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $false
            [System.IO.File]::WriteAllText($filePath, $content, $utf8NoBomEncoding)
            
            Write-Host "Fixed encoding for file: $($_.Name)"
        }
    }
}

Write-Host "Done!" 