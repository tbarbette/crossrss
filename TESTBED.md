# Testbed

All of the experiments require a single server with at least 17 cores. 16 to simulate 4 servers with 4 cores, and one to replay a trace. 

Our experiments require `npf` and `fastclick`. You should setup your testbed based on the following guidelines.

## Network Performance Framework (NPF) Tool

We use [NPF][npf-repo] tool to run our experiments. However, it is possible to run them manually. To setup NPF, you can run the following commands:

```bash
sudo apt install python3 python3-pip
pip3 install --user npf
```

NPF uses ssh to connect to the servers. Please make sure that you have setup passwordless ssh on your system. If you want to use your current key (e.g., `ida_rsa`) on a different server, you can run the following commands:

```bash
eval $(ssh-agent -s)
ssh-add ~/.ssh/ida_rsa
```

You can check [NPF README][npf-readme] file for more information.

## Fastclick

We use [Fastclick][fastclick-repo] to generate and process packets. To build Fastclick, you can run the following commands. Every element used for this test has been reverted to mainline FastClick.

```bash
git clone git@github.com:tbarbette/fastclick.git
cd fastclick
sudo apt-get install libpci-dev
./configure RTE_SDK=/home/alireza/ddio-bench/dpdk RTE_TARGET=x86_64-native-linux-gcc --enable-multithread --disable-linuxmodule --enable-intel-cpu --enable-user-multithread --verbose CFLAGS="-std=gnu11 -O3" CXXFLAGS="-std=gnu++14 -O3" --disable-dynamic-linking --enable-poll --enable-dpdk --disable-dpdk-pool --disable-dpdk-packet --enable-research
make
```

Note that you should change `RTE_SDK` and `RTE_TARGET` in the `configure` command.

## Other Configurations

Below, you can find some useful hints for optimizing your testbed.

### Isolating a CPU Socket

To have a more accurate measurement, we recommend you to isolate one CPU socket. By doing so, you ensure that operating system is not polluting your cache. To do so, you can add the following commands to the `GRUB` commandline in `/etc/default/grub`. To find the cores located on a CPU socket, you can use `lscpu` command.

```bash
GRUB_CMDLINE_LINUX="isolcpus=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17"
```

### Other Commandlines

There are more options for the `GRUB_CMDLINE` to optimize your system. We used the followings:

```bash
GRUB_CMDLINE_LINUX="isolcpus=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17 iommu=pt intel_iommu=on default_hugepagesz=1GB hugepagesz=1G hugepages=128 acpi=on selinux=0 audit=0 nosoftlockup processor.max_cstate=1 intel_idle.max_cstate=0 intel_pstate=on nopti nospec_store_bypass_disable nospectre_v2 nospectre_v1 nospec l1tf=off netcfg/do_not_use_netplan=true mitigations=off"
```

Note that you need to run `sudo update-grub` and reboot your system after changing `/etc/default/grub`.

### Changing Frequency

It is essential to check the processor's frequency before running any experiment so that you could reproduce them later.

- **Checking**: To check the processor's frequency you can use one of the following methods:
    1. `lscpu | grep "CPU" | grep "MHz"`
    2. `cat /proc/cpuinfo | grep "processor\|MHz"`
    3. `sudo lshw -c cpu | grep "*-cpu\|MHz"`
    4. `sudo dmidecode -t processor | grep Speed`
    5. `sudo watch -n 1  cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq`

    The last method prints the frequency of each core every second. Note that instead of using `cpu*`, you can print the frequency of a subset of cores (e.g., `cpu[0-7]`).

- **Changing**: To change the frequency of the processors, you can use `cpupower` tool, as follows:

    ```bash
    sudo cpupower frequency-set -u 2.3G -d 2.3G
    ```

  - `-u` specifies the maximum frequency, while `-d` shows the minimum frequency for each core. To have a fixed frequency, you can set both of them to a single frequency (e.g., `2.3G`).
  - `sudo cpupower frequency-info | grep "hardware limits"` or `lscpu | grep "CPU" | grep "MHz"` print the minimum/maximum frequencies for the processor.
  - You can get the nominal frequency of the processor via: `cat /proc/cpuinfo | grep model | grep -o "[0-9.]\+G" | head -n 1`

For more information, check [here][cpu-freq-link].

## Acknowledgments
This file has mainly been adapted from Alireza Farshin's "DDIO Bench" repository at https://github.com/aliireza/ddio-bench/blob/master/TESTBED.md

[crossrss-poster]: https://dl.acm.org/doi/abs/10.1145/3386367.3431672
[conext20-page]: https://conferences2.sigcomm.org/co-next/2020/#!/home
[npf-repo]: https://github.com/tbarbette/npf
[npf-readme]: https://github.com/tbarbette/npf#network-performance-framework
[fastclick-repo]: https://github.com/tbarbette/fastclick
[barbette-page]: https://www.tombarbette.be
[rsspp-paper]: https://dl.acm.org/doi/10.1145/3359989.3365412
