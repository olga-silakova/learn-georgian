
# RHVoice  https://github.com/RHVoice/RHVoice/blob/master/doc/en/Binaries.md
# https://gist.github.com/lazywinadmin/51619a0e47f4c8e7a8b7
$word = "კომში"
$FileName = "C:\Projects\georgian\fruits\$word.wav"

Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.rate = -3 #slow
$speak.Volume = 100


$speak.SelectVoice('Natia')

# Play a sound
$speak.Speak($word)

$speak.SetOutputToWaveFile("$Filename")

$speak.Speak($word)
$speak.Dispose()