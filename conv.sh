find . -iname "*.mov" -exec bash -c 'mv "$0" "${0%\.mov}.mp4"' {} \;
find . -iname "*.avi" -exec bash -c 'mv "$0" "${0%\.avi}.mp4"' {} \;
find . -iname "*.flv" -exec bash -c 'mv "$0" "${0%\.flv}.mp4"' {} \;
find . -iname "*.mkv" -exec bash -c 'mv "$0" "${0%\.mkv}.mp4"' {} \;
find . -iname "*.wmv" -exec bash -c 'mv "$0" "${0%\.wmv}.mp4"' {} \;
