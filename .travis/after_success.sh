# Inspired by http://sleepycoders.blogspot.se/2013/03/sharing-travis-ci-generated-files.html


if [ "$TRAVIS_PULL_REQUEST" == "false" ] ; then

  echo -e "\n>>> Current Repo:$REPO --- Travis Branch:$TRAVIS_BRANCH"


  echo -e "\n>>> CGrunt the doc."
  grunt build-doc
  cp -R doc $HOME/doc

  cd $HOME
  echo -e "\n>>> Cloning repo build branch."
  git clone --branch=gh-pages $REPO  tmp-gh-pages

  cd tmp-gh-pages
  cp -Rf $HOME/doc/* .


  echo -e "\n>>> Force adding and commiting."
  git add -f .
  git commit -m "Travis commit : build $TRAVIS_BUILD_NUMBER"
  echo -e "\n>>> Pushing result :"
  git push -fq origin gh-pages

  echo -e "All done.\n"
fi