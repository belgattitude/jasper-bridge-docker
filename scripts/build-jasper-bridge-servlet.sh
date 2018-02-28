#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$SCRIPT_DIR/.."

# PHPJavabridge version
PJB_VERSION="master"
PJB_DIR="$SCRIPT_DIR/downloads/php-java-bridge-$PJB_VERSION"

JAVA_BIN=`which java`

JASPER_BRIDGE_WAR=${SCRIPT_DIR}/../webapps/jasper-bridge.war

cd $SCRIPT_DIR;

buildJavaBridgeServer() {

    echo "[*] Download and build PHPJavaBridge";
    cd downloads;

    wget https://github.com/belgattitude/php-java-bridge/archive/${PJB_VERSION}.zip -O pjb.zip;
    if [ -d "${PJB_DIR}" ]; then
        rm -rf "${PJB_DIR}";
    fi;

    unzip pjb.zip && cd php-java-bridge-${PJB_VERSION};

    # Set the jasper gradle
    cp -f ${SCRIPT_DIR}/build.gradle ./build.gradle

    # Set the custom web.xml
    cp -f ${SCRIPT_DIR}/web.xml ./src/main/webapp/WEB-INF/web.xml

    # Remove Java.inc, JavaProxy.php...
    rm -rf ./src/main/webapp/java

    ./gradlew clean
    ./gradlew war

    mv ${PJB_DIR}/build/libs/jasper-bridge.war ${JASPER_BRIDGE_WAR}

    # restore path
    cd ${SCRIPT_DIR};

}


buildJavaBridgeServer;
