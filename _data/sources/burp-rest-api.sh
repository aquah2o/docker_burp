#!/bin/bash -xe
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo $SCRIPTPATH
CLASSPATH="$(echo $SCRIPTPATH/build/libs/*.jar | tr ' ' ':'):$(echo $SCRIPTPATH/*.jar | tr ' ' ':')"
echo $CLASSPATH
java -cp "$CLASSPATH" org.springframework.boot.loader.JarLauncher $@
