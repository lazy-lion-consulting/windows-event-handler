 Param($EventID)
################################################################
#                          SETTINGS                            #
################################################################
$CustomerSiteDetails    = "<USEFUL INFORMATION ABOUT SYSTEM>"
$EmailFrom              = "<FROM EMAIL ADDRESS>"
$EmailTo                = "<TO EMAIL ADDRESS 01>,<TO EMAIL ADDRESS 02>"
$SMTPServer             = "<IP/FQDN>"
#$SMTPClient.EnableSsl   = $true
#$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("sios@medfordband.com", "MySMTPP@55w0rd");
################################################################
#                       GET ALERT DETAILS                      #
################################################################
$A = Get-WinEvent -LogName System -MaxEvents 1 -FilterXPath "*[System[EventID=$EventID]]"
$Message = $A.Message
$EventID = $A.Id
$MachineName = $A.MachineName
$Time = $A.TimeCreated
$Level = $A.LevelDisplayName
################################################################
#                         MAIL CONTENT                         #
################################################################
$Subject = "Alert From $MachineName - EventID [$EventID] - $Level"
$Body    = "An issue was detected on [$MachineName] at [$CustomerSiteDetails]`n`n"
$Body   += "Details:`n EventID : $EventID`n Server : $MachineName`n` Time : $Time`n"
$Body   += " Message : $Message`n`nPlease read the Windows logs for further details."
################################################################
#                            CODE                              #
################################################################
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25)
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)

Exit 
