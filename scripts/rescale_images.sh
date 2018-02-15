shopt -s nullglob
for f in $(find ../../images/ -name '*.png' -or -name '*.jpg' -or -name '*.jpeg' -or -name '*.pdf'); do
  echo $f
  name=${f%.*}
  filename=$(basename "$f")
  extension="${filename##*.}"
  echo $extension
  a=$( identify -format '%wx%h' "$f")
  width="$(cut -d'x' -f1 <<<"$a")"
  height="$(cut -d'x' -f2 <<<"$a")"
  ratio="$(bc <<< "scale=2; "$width"/"$height"")"
  rotate="$( bc -l<<< $ratio">1.0")"
  if [ $rotate = 0 ] ; then
    if [ $width = "720" ] && [ "$extension" = "png" ] ; then
      echo "break"
      continue
    fi
    convert -geometry 720x $f $name.png
  else
    if [ $height = "540" ] && [ "$extension" = "png" ] ; then
      echo "break"
      continue
    fi
    convert -geometry x540 $f $name.png
  fi
done

for f in $(find ../../images/ -name '*.jpg' -or -name '*.jpeg' -or -name '*.pdf'); do
  rm $f
done
