find . -iname "*.mov" -exec bash -c 'mv "$0" "${0%\.mov}.mp4"' {} \;
find . -iname "*.avi" -exec bash -c 'mv "$0" "${0%\.avi}.mp4"' {} \;
find . -iname "*.flv" -exec bash -c 'mv "$0" "${0%\.flv}.mp4"' {} \;
find . -iname "*.mkv" -exec bash -c 'mv "$0" "${0%\.mkv}.mp4"' {} \;
find . -iname "*.m4v" -exec bash -c 'mv "$0" "${0%\.m4v}.mp4"' {} \;
find . -iname "*.wmv" -exec bash -c 'mv "$0" "${0%\.wmv}.mp4"' {} \;
#find . -iname "*.mp3" -exec bash -c 'mv "$0" "${0%\.mp3}.mp4"' {} \;
find . -iname "*.webm" -exec bash -c 'mv "$0" "${0%\.webm}.mp4"' {} \;
for fname in *.mp4; do (mv "$fname" $(echo "$fname" | sha1sum | cut -f1 -d' ').mp4; ) done
