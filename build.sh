#!/usr/bin/env bash
##################################
# Author : cndaqiang             #
# Update : 2020-07-25            #
# Build  : 2020-07-25            #
# What   : 构建网页               #
#################################
#从html目录提取网页元素
htmldir=./html
header=$htmldir/header.html
footer=$htmldir/footer.html
index=./index.html
mirrirdir=./mirrors
url="packages/" #仓库名
#============== header
echo "<!doctype html>" > $index
echo "<html>" >> $index
cat $header >> $index
#软件下载链接
echo -e "\n<body>" >> $index
for soft in $(ls $mirrirdir )
do
    echo -e "<h2> mirror web </h2>" >> $index 
    echo -e "<a href=\"\">gitee:更新快</a><br>" >> $index  
    echo -e "<a href=\"https://cndaqiang.github.io/packages/\">github:网速慢暂停更新</a><br>" >> $index  
    #
    softdir=$mirrirdir/$soft
    if [ ! -d "$softdir" ] ; then continue ;  fi
    #soft
    echo -e "<h2> $soft </h2>" >> $index 
    for version in $(ls $softdir )
    do
        #直接是程序
        versiondir=$softdir/$version
        if [ ! -d "$versiondir" ] 
        then 
            link=$url/$mirrirdir/$soft/$version
            echo -e "<a href=\"$link\">$version</a><br>" >> $index  
            continue      
        fi
        #继续分类
        
        for file in $(ls $versiondir )
        do
            filedie=$versiondir/$file
            if [  -d "$filedie" ] ; then continue ;  fi
            link=$url/$mirrirdir/$soft/$version/$file
            echo -e "<a href=\"$link\">$file</a>" >> $index
        done
        
    done
    echo "<hr>" >> $index
done









echo -e "\n</body>" >> $index
#============= footer
cat $footer >> $index
echo -e "\n</html>" >> $index
