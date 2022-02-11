#!bash
cd posts
# git pull
cd ..
cat content/feed.template.gmi > content/feed.gmi
for i in $(ls -t posts/*.gmi)
do
	echo $i
	cp $i content/posts
	NAME=$(basename $i)
	DATE=$(git blame test-post.gmi | cut -d ' ' -f 4 | tac | head -n 1)
	echo "=> /posts/$NAME $DATE ${NAME%.gmi}" >> content/feed.gmi
done