for f in *.jpg; do
  convert -geometry 720x "$f" "$f"
done
