<#This PowerShell script/command searches the Windows EventViewer for an EventID based on the number of hours
added on the time variable ($time) and output into a csv file.#>

#Time
$time=(Get-Date).AddHours(-24)

#System log for a specific InstanceId
$EventID= 10016

#File location
$filelocation="c:\Temp\EventIDlog.csv"

#Collects data base on the variables and Exports
Get-EventLog -LogName System -InstanceId $EventID -After $time | export-csv $filelocation
