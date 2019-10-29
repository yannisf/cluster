#!/bin/bash

JDK=OpenJDK8U-jdk_x64_linux_hotspot_8u232b09.tar.gz
SPARK=spark-2.4.4-bin-hadoop2.7.tgz

wget https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09/$JDK

wget http://apache.otenet.gr/dist/spark/spark-2.4.4/$SPARK

ssh-keygen -f vmcluster.id_rsa -P ""

cp $JDK vm2
cp $SPARK vm2
cp vmcluster.id_rsa* vm2

cp $JDK vm3
cp $SPARK vm3
cp vmcluster.id_rsa* vm3

cp $JDK vm3
cp $SPARK vm3
cp vmcluster.id_rsa* vm3

