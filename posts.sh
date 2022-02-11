git pull origin main
cat ../content/feed.template.gmi > ../content/feed.gmi
for i in $(ls -t *.gmi)
do
	echo $i
	cat $i | tail -n +2 > ../content/posts/$(basename $i)
	NAME=$(basename $i)
	TITLE=$(cat $i | head -n 1)
	DATE=$(git blame $i | cut -d ' ' -f 4 | tac | head -n 1)
	echo "=> /posts/$NAME $DATE $TITLE" >> ../content/feed.gmi
done