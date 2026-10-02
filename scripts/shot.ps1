param([string]$Bat, [string]$Dir, [int]$Wait = 6)
# Opens a fresh cmd window that runs the given batch file (echo on), for taking a screenshot.
$base = "C:\Users\ssh\Documents\claude-space\lab_4_software_construction"
Get-CimInstance Win32_Process -Filter "Name='cmd.exe'" |
    Where-Object CommandLine -match 'lab_4_software_construction\\bat' |
    ForEach-Object { Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue }
Start-Sleep 1
if (-not $Bat) { return }
if (-not $Dir) { $Dir = "$base\ps0" }
$env:GIT_PAGER = ''
$env:Path = "$base\tools\jre\bin;$env:Path"
Start-Process wt -ArgumentList '--pos', '20,20', '--size', '112,34', '-d', "`"$Dir`"", 'cmd', '/k', "`"$base\bat\$Bat.bat`""
Start-Sleep $Wait
