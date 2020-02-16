#!/bin/bash

cd ..

DOWNLOAD_DIR=downloads
JDK=OpenJDK8U-jdk_x64_linux_hotspot_8u232b09.tar.gz
SPARK=spark-2.4.5-bin-hadoop2.7.tgz
HADOOP=hadoop-3.2.1.tar.gz
KEY=vmcluster.id_rsa

wget -P $DOWNLOAD_DIR https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09/$JDK
wget -P $DOWNLOAD_DIR http://apache.otenet.gr/dist/spark/spark-2.4.5/$SPARK
wget -P $DOWNLOAD_DIR http://apache.otenet.gr/dist/hadoop/common/hadoop-3.2.1/$HADOOP

ssh-keygen -f $KEY -P ""
cp $DOWNLOAD_DIR/$JDK $DOWNLOAD_DIR/$SPARK $DOWNLOAD_DIR/$HADOOP $KEY* vm1
cp $DOWNLOAD_DIR/$JDK $DOWNLOAD_DIR/$SPARK $DOWNLOAD_DIR/$HADOOP $KEY* vm2
rm $KEY*

cp spark-conf/spark-env.sh.template vm1/spark-env.sh
cp spark-conf/spark-env.sh.template vm2/spark-env.sh
cp spark-conf/slaves vm1/slaves

cp -R hadoop-conf vm1/
cp -R hadoop-conf vm2/
