#This PowerShell script/command searches for a program installed on a list of workstations and remotely uninstall if the program version exists.
 
<#ComputerList Variable - Location of the Computer Names File.
This should be a text file containing one computer name or IP address per line.
Computers should be windows machines only and be contactable via remote management (WinRM) requests#>

#Identifying Number collected using command (Get-WmiObject Win32_Product | Select-Object -Property IdentifyingNumber, Name)
$IDnumber="{1F01050D-1A59-3443-9FD9-2FA69B9F3386}" #Google Chrome

#Location of the Computer Names File
$ComputerList = Get-Content -path "c:\Temp\computernames.txt"

#PowerShell Loop that reads file and exescutes command to each computer on the list
Foreach ($Computer in $ComputerList) {
 
 $Google = Get-WmiObject Win32_Product | Where-Object {$_.IdentifyingNumber -eq $IDnumber}
if ($Google) {
  $Google.Uninstall()
}
else {
  $IDnumber + ' is not installed on ' + $ComputerName
}

} 
