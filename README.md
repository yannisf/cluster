# VM Cluster

This is a set of files to facilitate the provisioning of a virtual machine cluster that will serve as a test bed and playground for various clustering scenarios. The configuration makes several internal network assumptions and do not offer itself for use by others. Nevertheless, it provides pointers of achieving several tasks.

## DNS/DHCP

It is assumed that a DNS/DHCP server exists in the network and that the virtual machines will receive predetermined IPs and names. Specifically:

- **vm1**: `192.168.1.101`
- **vm2**: `192.168.1.102`
- **vm3**: `192.168.1.103`
- **vm4**: `192.168.1.104`

## Shared storage

NFS is the common storage solution used. Currently, **vm1** sets up a shared directory, `/cluster` that all other VMs mount.

## Provisioning

Java and Spark is installed by default. Dont forget to run the `prepare.sh` script before firing up the virtual machines.

## Scripts

- `start.sh`: Starts all VMs
- `stop.sh`: Stops all VMs
- `destroy.sh`: Destroys all VMs


## Launching

### Start/Stop HDFS

```
$ start-dfs.sh
$ hdfs dfs -mkdir -p /user/yannis
$ hdfs dfs -chown yannis:yannis /user/yannis
$ hdfs dfs -copyFromLocal <file> hdfs://vm1/user/yannis
$ stop-dfs.sh
```

* Namenode: hdfs://vm1:8020/
* HTTP: http://vm1:9870/

* Datanode: vm1:9866
* HTTP: http://vm1:9864

#### File operations

```
 $ hadoop fs -copyFromLocal OpenJDK8U-jdk_x64_linux_hotspot_8u232b09.tar.gz hdfs://vm1/
 ```

### Start/Stop YARN

```
$ start-yarn.sh
$ stop-yarn.sh
```

* Resource Manager: http://vm1:8088
* Node Manager: http://vm1:8042

### Start spark cluser in standalone mode

```
$ /opt/spark/sbin/start-all.sh
$ /opt/spark/bin/spark-submit --master spark://vm1:7077 --deploy-mode client estpi_2.11-1.0.jar

$ HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop /opt/spark/bin/spark-submit \
    --master yarn \
    --deploy-mode cluster \
    --num-executors 4 \
    --executor-memory 512M \
    --driver-memory 512M \
    estpi_2.11-1.0.jar
```

Spark master provides a UI on vm1:8080 for master and on :8081 for workers. It receives jobs on vm1:7077. While running a job a SparkUI is launched, typically on vm1:4040 onwards.
