#!/bin/bash

cd vm1
vagrant destroy -f
cd ../vm2
vagrant destroy -f
cd ../vm3
vagrant destroy -f
cd ../vm4
vagrant destroy -f

