# Only gets the offending application / program within the last hour after the user attempted to eject the USB media.
$output = Get-EventLog -LogName System -after (Get-Date).AddHours(-1) | Where-Object {$_.EventID -eq 225} | Sort-Object TimeGenerated | Select-Object Message
$string = $output -Split "\s+"
$program = $string[2]
Write-Output $program