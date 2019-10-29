#!/bin/bash

JDK=OpenJDK8U-jdk_x64_linux_hotspot_8u232b09.tar.gz
SPARK=spark-2.4.4-bin-hadoop2.7.tgz
KEY=vmcluster.id_rsa

#wget https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09/$JDK
#wget http://apache.otenet.gr/dist/spark/spark-2.4.4/$SPARK
ssh-keygen -f $KEY -P ""

cp $JDK $SPARK $KEY* vm1
cp $JDK $SPARK $KEY* vm2
cp $JDK $SPARK $KEY* vm3
cp $JDK $SPARK $KEY* vm4

cp spark-env.sh.template vm1/spark-env.sh
cp spark-env.sh.template vm2/spark-env.sh
cp spark-env.sh.template vm3/spark-env.sh
cp spark-env.sh.template vm4/spark-env.sh
