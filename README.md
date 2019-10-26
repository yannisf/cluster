# VM Cluster

This is a set of files to facilitate the provisioning of a virtual machine cluster that will serve as a test be and playground for various clustering scenarios. The configuration makes several internal network assumptions and do not offer itself for use by others. Nevertheless, given certain it provides pointers of achieving several tasks.

## DNS/DHCP

It is assumed that a DNS/DHCP server exists in the network and that the virtual machines will receive predetermined IPs and names. Specifically:

- **vm1**: `192.168.1.101`
- **vm2**: `192.168.1.102`
- **vm3**: `192.168.1.103`
- **vm4**: `192.168.1.104`

## Shared storage

NFS is the common storage solution used. It is assumed that a server is avaialble and a directory is mounted on each virtual machine under `/mnt`.

## Provisioning

Java and Spark is installed by default. Dont forget to run the `prepare.sh` script before firing up the virtual machines.
