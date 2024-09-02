set -x
# $1: device for output
#     spk: speaker
#     top-spk: top speaker
#     bot-spk: bottom speaker
#     rcv: receiver
#     spk_hp: speaker high power
#     top-spk_hp: top speaker high power
#     bot-spk_hp: bottom speaker high power
#     us: ultrasound

# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh spk
# rcv.wav:-4.5dbfs   spk: -4.8dbfs  ultra: -4.5dbfs  spk_hp:-1.8dbfs

function enable_receiver
{
    echo "enabling receiver"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 1
    tinymix 'ADDA_DL_CH2 DL1_CH2' 1
    tinymix 'DAC In Mux' 'Normal Path'
    tinymix 'RCV Mux' 'Voice Playback'
    tinymix 'RCV Switch' 1

    sleep 1
}

function disable_receiver
{
    echo "disabling receiver"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 1
    tinymix 'ADDA_DL_CH2 DL1_CH2' 1
    tinymix 'RCV Mux' 'Open'
    tinymix 'RCV Switch' 0
}

function enable_speaker
{
    echo "enabling speaker"
    tinymix 'I2S3_CH1 DL1_CH1' 1
    tinymix 'I2S3_CH2 DL1_CH2' 1
    tinymix 'I2S3_HD_Mux' 'Low_Jitter'
    tinymix 'RCV Switch' 0

    sleep 1
}

function disable_speaker
{
    echo "disabling speaker"
    tinymix 'I2S3_CH1 DL1_CH1' 0
    tinymix 'I2S3_CH2 DL1_CH2' 0
    tinymix 'I2S3_HD_Mux' 'Normal'
}

function enable_speaker_top
{
    echo "enabling speaker top"
    tinymix 'I2S3_CH1 DL1_CH1' 1
    tinymix 'I2S3_CH2 DL1_CH2' 1
    tinymix 'I2S3_HD_Mux' 'Low_Jitter'
    tinymix 'RCV PCM Source' 'ASP'
    tinymix 'PCM Source' 'None'
    tinymix 'RCV AMP PCM Gain' 14
    tinymix 'RCV Switch' 0
    sleep 1
}

function disable_speaker_top
{
    echo "disabling speaker top"
    tinymix 'I2S3_CH1 DL1_CH1' 0
    tinymix 'I2S3_CH2 DL1_CH2' 0
    tinymix 'I2S3_HD_Mux' 'Normal'
    tinymix 'RCV PCM Source' 'DSP'
    tinymix 'PCM Source' 'DSP'
    tinymix 'RCV AMP PCM Gain' 17

}
function enable_speaker_bot
{
    echo "enabling speaker bottom"
    tinymix 'I2S3_CH1 DL1_CH1' 1
    tinymix 'I2S3_CH2 DL1_CH2' 1
    tinymix 'I2S3_HD_Mux' 'Low_Jitter'
    tinymix 'RCV PCM Source' 'None'
    tinymix 'PCM Source' 'ASP'
    tinymix 'AMP PCM Gain' 14

    sleep 1
}

function disable_speaker_bot
{
    echo "disabling speaker bottom"
    tinymix 'I2S3_CH1 DL1_CH1' 0
    tinymix 'I2S3_CH2 DL1_CH2' 0
    tinymix 'I2S3_HD_Mux' 'Normal'
    tinymix 'RCV PCM Source' 'DSP'
    tinymix 'PCM Source' 'DSP'
    tinymix 'AMP PCM Gain' 18

}

function enable_ultrasound
{
    echo "enable ultrasound"

    tinymix 'ADDA_DL_CH1 DL7_CH1' 1
    tinymix 'ADDA_DL_CH2 DL7_CH2' 1
    tinymix 'DAC In Mux' 'Normal Path'
    tinymix 'RCV Mux' 'Voice Playback'
    tinymix 'RCV Switch' 1

    sleep 1
}

function disable_ultrasound
{
    echo "disable ultrasound"

    tinymix 'ADDA_DL_CH1 DL7_CH1' 1
    tinymix 'ADDA_DL_CH2 DL7_CH2' 1
    tinymix 'RCV Mux' 'Open'
    tinymix 'RCV Switch' 0
}


if [ "$1" = "spk" ]; then
    enable_speaker
    filename=/vendor/etc/spk.wav
    pcm_id=0
elif [ "$1" = "top-spk" ]; then
    enable_speaker_top
    filename=/vendor/etc/top_spk.wav
    pcm_id=0
elif [ "$1" = "bot-spk" ]; then
    enable_speaker_bot
    filename=/vendor/etc/bottom_spk.wav
    pcm_id=0
elif [ "$1" = "spk_hp" ]; then
    enable_speaker
    filename=/vendor/etc/spk_hp.wav
    pcm_id=0
elif [ "$1" = "top-spk_hp" ]; then
    enable_speaker_top
    filename=/vendor/etc/spk_hp.wav
    pcm_id=0
elif [ "$1" = "bot-spk_hp" ]; then
    enable_speaker_bot
    filename=/vendor/etc/bottom_spk_hp.wav
    pcm_id=0
elif [ "$1" = "rcv" ]; then
    enable_receiver
    filename=/vendor/etc/rcv.wav
    pcm_id=0
elif [ "$1" = "us" ]; then
    enable_ultrasound
    filename=/vendor/etc/ultrasound.wav
    pcm_id=7
else
    echo "Usage: playback.sh device; device: spk or spk_hp or rcv"
fi

#Only for cs35l41 smartPA Begin
echo "Enable I2S3_GPIO to On"
tinymix "I2S3_GPIO" "On"
sleep 0.2
#Only for cs35l41 smartPA End

echo "start playing"
tinyplay $filename -D 0 -d $pcm_id

if [ "$1" = "spk" ]; then
    disable_speaker
elif [ "$1" = "top-spk" ]; then
    disable_speaker_top
elif [ "$1" = "bot-spk" ]; then
    disable_speaker_bot
elif [ "$1" = "spk_hp" ]; then
    disable_speaker
elif [ "$1" = "top-spk_hp" ]; then
    disable_speaker_top
elif [ "$1" = "bot-spk_hp" ]; then
    disable_speaker_bot
elif [ "$1" = "rcv" ]; then
    disable_receiver
elif [ "$1" = "us" ]; then
    disable_ultrasound
fi

exit 0
