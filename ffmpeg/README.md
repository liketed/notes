Convert .mov to .gif:


ffmpeg -i shellrecording.mov -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > shell1.gif
