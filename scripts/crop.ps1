param([string]$Blob, [int[]]$R, [string]$Out)
# Crops a saved screenshot (tool-results blob name) to region x0,y0,x1,y1 and saves it as PNG in shots\.
Add-Type -AssemblyName System.Drawing
$d = "C:\Users\ssh\.claude\projects\C--Users-ssh-Documents-claude-space\b7216ea6-06f7-4d31-8ae3-90452c049067\tool-results"
$base = "C:\Users\ssh\Documents\claude-space\lab_4_software_construction"
$src = [System.Drawing.Bitmap]::FromFile("$d\$Blob")
$rect = New-Object System.Drawing.Rectangle $R[0], $R[1], ($R[2] - $R[0]), ($R[3] - $R[1])
$dst = $src.Clone($rect, $src.PixelFormat)
$dst.Save("$base\shots\$Out.png", [System.Drawing.Imaging.ImageFormat]::Png)
$dst.Dispose(); $src.Dispose()
"$Out.png saved"
