<powershell>
# Change Password
$admin = [adsi]("WinNT://./administrator, user")
$admin.PSBase.Invoke("SetPassword", "Nopass123")

# Configure machine for ansible remoting
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -EnableCredSSP

Set-ItemProperty -Name LocalAccountTokenFilterPolicy -Path HKLM:\software\Microsoft\Windows\CurrentVersion\Policies\system -Value 1
</powershell>