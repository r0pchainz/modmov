grep "torrentz2.eu" *.html > file1
replace "https://torrentz2.eu/" "" -- file1
grep -oP '"\K[^"\047]+(?=["\047])'  file1 > file2
grep -o -w -E '^[[:alnum:]]{40}' file2 > file1
sort -u file1 > file2

grep "academictorrents.com" *.html > file3
replace "http://academictorrents.com/details/" "" -- file3
grep -oP '"\K[^"\047]+(?=["\047])'  file3 > file4
grep -o -w -E '^[[:alnum:]]{40}' file4 > file3
sort -u file3 > file4
