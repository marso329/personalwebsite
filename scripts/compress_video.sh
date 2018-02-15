shopt -s nullglob
for f in $(find ../../images/ -name '*[^-][^c][^o][^m][^p].mp4' -or -name '*.mkv' -or -name '*.wmv' -or -name '*.flv' -or -name '*.webm' -or -name '*.mov' -or -name '*.avi'); do
  echo $f
  name=${f%.*}
 ffmpeg -i $f  -vcodec libx264 -pix_fmt yuv420p -b:v 1000k -acodec mp3 -profile:v baseline -level 3 $name-comp.mp4
done

for f in $(find ../../images/ -name '*[^-][^c][^o][^m][^p].mp4' -or -name '*.mkv' -or -name '*.wmv' -or -name '*.flv' -or -name '*.webm' -or -name '*.mov' -or -name '*.avi'); do
 rm $f
done
