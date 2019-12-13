<#$wc = New-Object System.Net.WebClient

#Check OS
if ([System.IntPtr]::Size -eq 4) {
    $dropboxUrl = 'https://www.dropbox.com/s/fet9dwb3p0nmuf2/UninstallView.exe?dl=1'
}
else {
    $dropboxUrl = 'https://www.dropbox.com/s/z1or9kwndi0dz3t/UninstallView_x64.exe?dl=1'
}

$wc.DownloadFile("$dropboxUrl",'C:\temp\UninstallView.exe')

Start-Sleep -Seconds 3
#>
c:\temp\UninstallView.exe /quninstall "Syncro"

#Cleanup any leftovers
echo Stopping Services
SC STOP Syncro
SC DELETE Syncro
SC STOP SyncroLive
SC DELETE SyncroLive
SC STOP SyncroOvermind
SC DELETE SyncroOvermind
echo Killing Processes
TASKKILL /im Syncro.App.Runner.exe /f
TASKKILL /im Syncro.Overmind.Service.exe /f
TASKKILL /im Syncro.Service.Runner.exe /f
TASKKILL /im SyncroLive.Agent.Runner.exe /f
TASKKILL /im SyncroLive.Agent.Service.exe /f
TIMEOUT 5
echo Remove Files
rmdir "C:\Program Files (x86)\Syncro" /s /q
rmdir "C:\Program Files\RepairTech" /s /q
rmdir "C:\Program Files\Syncro" /s /q
rmdir "C:\ProgramData\Syncro" /s /q
echo Delete Registry files for App and Service
reg delete HKEY_CLASSES_ROOT\Installer\Products\D3D65F7B3DA21204D963B3E9C9F9EB33 /f
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\D3D65F7B3DA21204D963B3E9C9F9EB33 /f
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Syncro /f
reg delete HKLM\SOFTWARE\RepairTech /f
reg delete HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Syncro /f
reg delete HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall{B7F56D3D-2AD3-4021-9D36-3B9E9C9FBE33} /f
reg delete HKLM\SOFTWARE\WOW6432Node\RepairTech /f
reg delete HKLM\SYSTEM\ControlSet001\Services\EventLog\Application\Syncro /f
reg delete HKLM\SYSTEM\ControlSet001\Services\EventLog\Application\SyncroLive /f
reg delete HKLM\SYSTEM\CurrentControlSet\Services\Syncro /f
reg delete HKLM\SYSTEM\CurrentControlSet\Services\SyncroLive /f
reg delete HKLM\SYSTEM\CurrentControlSet\Services\SyncroOvermind /f
