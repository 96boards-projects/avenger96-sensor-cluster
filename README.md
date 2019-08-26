# Sensor Cluster using 96Boards Avenger96

# Table of Contents
- [1) Hardware](#1-hardware)
   - [1.1) Hardware Requirements](#11-hardware-requirements)
   - [1.2) Hardware Setup](#12-hardware-setup)
- [2) Software](#2-software)
   - [2.1) Operating System](#21-operating-system)
   - [2.2) Package Dependencies](#22-package-dependencies)
- [3) Building and running](#3-building-and-running)

# 1. Hardware

## 1.1 Hardware Requirements:

1. [Avenger96](https://www.96boards.org/product/avenger96/)
2. [Power Supply](https://www.amazon.com/Adapter-Regulated-Supply-Copper-String/dp/B015G8DZK2)
3. [Sensors Mezzanine](http://www.96boards.org/product/sensors-mezzanine/)

# 2. Software

## 2.1 Operating System:

Install OpenSTLinux distribution:

# 3. Building and running

#### Setup Zephyr environment

Setup Zephyr environment as per below guide:
https://docs.zephyrproject.org/latest/getting_started/index.html

#### Update Zephyr modules

OpenAMP module in Zephyr needs to be updated as below:

```
$ cd zephyrproject/modules/lib/open-amp
$ git remote add arno https://github.com/arnop2/open-amp-1
$ git fetch arno
$ git cherry-pick 28cc6fb3023f4c8827636156b3fce2627b47f882
	(resource table: add helper to add resource table in project.)
$ git cherry-pick aead88f6edb8f5cac47b6ba441fbecef0bbd38bf
	(remoteproc: fix compilation warning in elf loader)
```

Update the SHA1 of the above change in `zephyrproject/zephyr/west.yml` under `open-amp/revision`

#### Switch to Demo Zephyr branch

Now, fetch and switch to the demo zephyr branch as below:

```
$ git remote add mani https://github.com/Mani-Sadhasivam/zephyr.git
$ git fetch mani
$ git checkout -t mani/avenger96-demo
```

#### Build

```
$ rm -rf build
$ west build -b 96b_avenger96 samples/subsys/ipc/openamp_rsc_table/remote
```
