AUTHOR=yabirgba
SOURCE_BRANCH=compound-tests
TARGET_BRANCH=bugfixes

# git remote add author https://github.com/$AUTHOR/test-caching.git

# git fetch author $SOURCE_BRANCH && git checkout -b $SOURCE_BRANCH author/$SOURCE_BRANCH || exit 0

# echo "Happy ending!"
# git checkout develop && git branch -D $SOURCE_BRANCH

AUTHOR=OjusWiZard
SOURCE_BRANCH=chore/ci
TARGET_BRANCH=bugfixesa

echo "https://api.github.com/repos/rotki/rotki/pulls?state=open&head=$AUTHOR:$SOURCE_BRANCH&base=$TARGET_BRANCH"
curl --silent "https://api.github.com/repos/rotki/rotki/pulls?state=open&head=$AUTHOR:$SOURCE_BRANCH&base=$TARGET_BRANCH" | jq "length"
if [ "`curl --silent "https://api.github.com/repos/rotki/rotki/pulls?state=open&head=$AUTHOR:$SOURCE_BRANCH&base=$TARGET_BRANCH" | jq "length"`" == "0" ]; then
    echo "Found the $SOURCE_BRANCH branch on $AUTHOR's test-caching fork. But no PR found. Aborting."
    exit 1
fi