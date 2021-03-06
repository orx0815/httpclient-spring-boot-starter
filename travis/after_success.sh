#!/bin/bash

# Only deploy master and develop branch to sonatype
if [[ $TRAVIS_REPO_SLUG == "deveth0/httpclient-spring-boot-starter" ]] && [[ "$TRAVIS_PULL_REQUEST" == "false" ]] && [[ "$TRAVIS_BRANCH" == "master" || "$TRAVIS_BRANCH" == "develop" ]]; then
  if [[ $TRAVIS_JDK_VERSION == "openjdk11" ]]; then
    gpg2 --allow-secret-key-import --batch --passphrase=$PASSPHRASE --keyring=$TRAVIS_BUILD_DIR/pubring.gpg --no-default-keyring --import ./travis/sonatype_signing.asc
    echo -e "Successfully imported GPG keys"

    mvn deploy -DskipTests=true -Prelease-profile --settings ./travis/maven-settings.xml -Dgpg.executable=gpg2 -Dgpg.keyname=05E8EEC0 -Dgpg.passphrase=$PASSPHRASE -Dgpg.publicKeyring=$TRAVIS_BUILD_DIR/pubring.gpg -Dgpg.secretKeyring=$TRAVIS_BUILD_DIR/pubring.gpg
    echo -e "Successfully deployed to sonatype"
  fi
else
  echo "Travis deployment skipped"
fi
