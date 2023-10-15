# Update links to use absolute path url to cdn site

echo "Aleady update! This script is for information purpose"
exit

f_list=$(find . -type f -name 'index.html' -exec echo {} \;)
IFS=$'\n'
for f in $f_list; do
    d=$(dirname "$f")
    path=${d:2}
    # https://stackoverflow.com/questions/296536/how-to-urlencode-data-for-curl-command
    path=$(printf "$path" | jq -sRr '@uri')
    echo "--- d: $d     f: $f    path: $path"
    sed -re "s|<a href=\"(.+)\.pdf\"|<a href=\"https://dhamma-library.cdn.winmetta.org/$path/\1.pdf\"|g" "$f" > "$d/index.htm"
    #[[ -f "$d/index.html.bak" ]] || mv -iv "$d/index.html" "$d/index.html.bak"
    #mv -iv "$d/index.html.bak" "$d/index.html"
    mv -v "$d/index.htm" "$d/index.html"
done
