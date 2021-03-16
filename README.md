Ubuntu Systemd Container Image
=====================

This Containerfile can build containers capable to use systemd.

[![ubuntu build status](https://quay.io/repository/ucomesdag/ubuntu/status "Container Repository on Quay")](https://quay.io/repository/ucomesdag/ubuntu)

Branches
--------

This repository one branche that relate to Ubuntu a version.

|Branch |Ubuntu Version             |Container image tag|
|-------|---------------------------|-------------------|
|jammy  |Jammy Jellyfish (22.04 LTS)|jammy              |
|main   |focal fossa (20.04 LTS)    |latest             |
|bionic |bionic beaver (18.04 LTS)  |bionic             |

Pull strategy
-------------

The different branches are **not** merged, they live as individual branches.

Manually starting
-----------------

```
podman run \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  quay.io/ucomesdag/ubuntu
```
