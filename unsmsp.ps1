$wc = New-Object System.Net.WebClient

#Check OS
if ([System.IntPtr]::Size -eq 4) {
    $dropboxUrl = 'https://www.dropbox.com/s/fet9dwb3p0nmuf2/UninstallView.exe?dl=1'
}
else {
    $dropboxUrl = 'https://www.dropbox.com/s/z1or9kwndi0dz3t/UninstallView_x64.exe?dl=1'
}

$wc.DownloadFile("$dropboxUrl",'C:\temp\UninstallView.exe')

c:\temp\UninstallView.exe /quninstall /RunAsAdmin "Syncro"
