#update and install pdftk
sudo apt-get update &&
sudo apt-get install pdftk ffmpeg -y

#convert all filenames to lowercase
#find my_root_dir -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;

#parse to mp4
find . -iname "*.mov" -exec bash -c 'mv "$0" "${0%\.mov}.mp4"' {} \;
find . -iname "*.avi" -exec bash -c 'mv "$0" "${0%\.avi}.mp4"' {} \;
find . -iname "*.flv" -exec bash -c 'mv "$0" "${0%\.flv}.mp4"' {} \;
find . -iname "*.mkv" -exec bash -c 'mv "$0" "${0%\.mkv}.mp4"' {} \;
find . -iname "*.m4v" -exec bash -c 'mv "$0" "${0%\.m4v}.mp4"' {} \;
find . -iname "*.wmv" -exec bash -c 'mv "$0" "${0%\.wmv}.mp4"' {} \;
find . -iname "*.webm" -exec bash -c 'mv "$0" "${0%\.webm}.mp4"' {} \;

#parse to pdf
find . -iname "*.odt" -exec bash -c 'mv "$0" "${0%\.odt}.pdf"' {} \;
find . -iname "*.txt" -exec bash -c 'mv "$0" "${0%\.txt}.pdf"' {} \;
find . -iname "*.docx" -exec bash -c 'mv "$0" "${0%\.docx}.pdf"' {} \;
find . -iname "*.doc" -exec bash -c 'mv "$0" "${0%\.doc}.pdf"' {} \;
find . -iname "*.djvu" -exec bash -c 'mv "$0" "${0%\.djvu}.pdf"' {} \;
find . -iname "*.epub" -exec bash -c 'mv "$0" "${0%\.epub}.pdf"' {} \;

#rename file to sha1
for fname in *.mp4; do (mv "$fname" $(echo "$fname" | sha1sum | cut -f1 -d' ').mp4; ) done

#rename file to sha1 in case of long name/ bad chars
for fname in *.pdf; do (mv "$fname" $(echo "$fname" | sha1sum | cut -f1 -d' ').pdf; ) done

for fuckit in *.pdf; 
do 
    cat=${fuckit::-4}
    mkdir $cat
    cp $fuckit $cat
    cd $cat
    pdftk $fuckit burst 
    #convert single pages pdf into jpg 
    for lovewiththecoco in *.pdf; 
    do
        cat=${lovewiththecoco::-4}
        cat="$cat.jpg"
        #removes exif max quality 300 dpi
        convert -strip -density 300 $lovewiththecoco  -quality 100 $cat
        rm $lovewiththecoco
    done
    rm $fuckit
    cd ../
    rm $fuckit 
done

for file in *.mp3; 
do 
    ffmpeg -loop 1 -i test.png -i $file -pix_fmt yuv420p -vf scale=iw:-2 -profile:v baseline -level 3.0 -shortest test.mp4
done
