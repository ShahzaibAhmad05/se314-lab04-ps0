param([string]$Name)
# Puts shots\<Name>.png on the Windows clipboard as an image.
Add-Type -AssemblyName System.Windows.Forms, System.Drawing
$img = [System.Drawing.Image]::FromFile("C:\Users\ssh\Documents\claude-space\lab_4_software_construction\shots\$Name.png")
[System.Windows.Forms.Clipboard]::SetImage($img)
$img.Dispose()
"$Name on clipboard"
