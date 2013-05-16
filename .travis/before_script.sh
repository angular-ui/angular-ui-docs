#
# Authentication
#
echo -e ">>> AngularUI (angular-ui@googlegroups.com) authentication!\n"

git remote set-url origin $REPO.git
git config --global user.email "angular-ui@googlegroups.com"
git config --global user.name "AngularUI (via TravisCI)"

if [ -z "$id_rsa_{1..23}" ]; then echo 'No $id_rsa_{1..23} found !' ; exit 1; fi

echo -n $id_rsa_{1..23} >> ~/.ssh/travis_rsa_64
base64 --decode --ignore-garbage ~/.ssh/travis_rsa_64 > ~/.ssh/id_rsa

chmod 600 ~/.ssh/id_rsa

echo -e ">>> Copy config"
mv -fv out/.travis/ssh-config ~/.ssh/config

echo -e ">>> Hi github.com !"
ssh -T git@github.com
echo -e "\n"
