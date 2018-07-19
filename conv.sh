#parse to mp4
find . -iname "*.mov" -exec bash -c 'mv "$0" "${0%\.mov}.mp4"' {} \;
find . -iname "*.avi" -exec bash -c 'mv "$0" "${0%\.avi}.mp4"' {} \;
find . -iname "*.flv" -exec bash -c 'mv "$0" "${0%\.flv}.mp4"' {} \;
find . -iname "*.mkv" -exec bash -c 'mv "$0" "${0%\.mkv}.mp4"' {} \;
find . -iname "*.m4v" -exec bash -c 'mv "$0" "${0%\.m4v}.mp4"' {} \;
find . -iname "*.wmv" -exec bash -c 'mv "$0" "${0%\.wmv}.mp4"' {} \;
#find . -iname "*.mp3" -exec bash -c 'mv "$0" "${0%\.mp3}.mp4"' {} \;
find . -iname "*.webm" -exec bash -c 'mv "$0" "${0%\.webm}.mp4"' {} \;

#parse to pdf
find . -iname "*.odt" -exec bash -c 'mv "$0" "${0%\.odt}.pdf"' {} \;
find . -iname "*.txt" -exec bash -c 'mv "$0" "${0%\.txt}.pdf"' {} \;
find . -iname "*.docx" -exec bash -c 'mv "$0" "${0%\.docx}.pdf"' {} \;
find . -iname "*.doc" -exec bash -c 'mv "$0" "${0%\.doc}.pdf"' {} \;


#rename file to sha1
for fname in *.mp4; do (mv "$fname" $(echo "$fname" | sha1sum | cut -f1 -d' ').mp4; ) done

#rename file to sha1
for fname in *.pdf; do (mv "$fname" $(echo "$fname" | sha1sum | cut -f1 -d' ').pdf; ) done

#split pdfs into single pages
for fuckit in *.pdf; 
do 
    pdftk $fuckit burst 
    rm $fuckit 
done

#convert single pages pdf into jpg and rename to sha256
for lovewiththecoco in *.pdf; 
do
 foo=$(pdftk $lovewiththecoco dump_data| grep NumberOfPages| awk '{print $2}')  
 if test $foo -e 1; then  
    cat=$(pwgen 13)
    cat="$cat.jpg"
    convert -density 300 $lovewiththecoco  -quality 100 $cat
 fi 
done
