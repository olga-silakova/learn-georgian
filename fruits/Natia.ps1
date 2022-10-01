$SAFT48kHz16BitStereo = 45
#$SAFT48kHz16BitStereo = 39
$SSFMCreateForWrite = 3  # Creates file even if file exists and so destroys or overwrites the existing file


$oFileStream = New-Object -ComObject sapi.SpFileStream

$oFileStream.Format.Type = $SAFT48kHz16BitStereo
$word = 'ხელი'
$FileName = "C:\Users\dell\Desktop\words\$word.wav"
$CodeFileName = "C:\Users\dell\Desktop\Sample5.txt"
$oFileStream.Open($FileName, $SSFMCreateForWrite)


$Sapi = New-Object -ComObject sapi.spvoice
$Sapi.AudioOutputStream = $oFileStream
$natiaVoice = $Sapi.GetVoices().Item(3)
$Sapi.Voice = $natiaVoice

$Sapi.Rate = -5
$Sapi.Speak($word)

$oFileStream.Close()

#$file = Get-Content -Path $FileName


#$Bytes = [System.Text.Encoding]::Unicode.GetBytes($file)
#$EncodedText =[Convert]::ToBase64String($Bytes)
#
$Code = '<audio controls><source src="data:audio/wav;base64,' + $EncodedText + '" /></audio>'

# Out-File -InputObject $Code -FilePath $CodeFileName
# Set-Content -Path $CodeFileName -Value $Code -Stream $true


# Write-Output $Code

#Set-Clipboard -Value $Code


