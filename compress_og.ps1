[Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null
$src = "c:\Users\Tanvir Kalha\Downloads\New folder\PORTFOLIO\assets\og-image.png"
$dest = "c:\Users\Tanvir Kalha\Downloads\New folder\PORTFOLIO\assets\og-image.jpg"

$img = [System.Drawing.Image]::FromFile($src)
$encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.FormatDescription -eq "JPEG" }
$params = New-Object System.Drawing.Imaging.EncoderParameters(1)
$params.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, 70) # 70% quality

$img.Save($dest, $encoder, $params)
$img.Dispose()

Write-Host "File created: $dest"
$size = (Get-Item $dest).Length
Write-Host "New Size: $size bytes"
