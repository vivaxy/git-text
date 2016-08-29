#/usr/env/sh
text="require"
sinceDate="2016-07-31"
logFile=git-text.log
echo "" > ./${logFile}
for dir in `find ./* -maxdepth 0 -type d`
do
    cd ${dir}
    pwd=`pwd`
    echo "${pwd}" >> ../${logFile}
    echo "------" >> ../${logFile}
    git fetch
    commits=`git log --all --pretty=format:%H --since=${sinceDate} -S${text}`
    for commit in "${commits}"
    do
        if [ "${commit}" != "" ]
        then
            echo "${commit}" >> ../${logFile}
            `pretty-diff ${commit}`
        fi
    done
    cd ..
done
