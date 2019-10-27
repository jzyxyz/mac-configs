colorls -d
echo ">> which folder?"
read foldername
cd $foldername
echo ">> title?"
read title
echo "---" > "$title.md"
echo "title: '$title'" >> "$title.md"
echo "date: '$(date +%Y-%m-%d)'" >> "$title.md"
echo "---" >> "$title.md"
echo "done, opens vs code...."
code "$title.md"