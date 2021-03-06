# CrossRSS: Stateless CPU-aware datacenter load-balancing

This repository contains information/source code to perform the experiments done in [CrossRSS][crossrss-poster] published at [CoNEXT'20 poster session][conext20-page].

## Experiments

**Note that you have to setup your testbed based on [our guidelines](TESTBED.md) before running any experiment.**
The experiments all replay a trace through a load-balancer that dispatches packets to 4 virtual servers, that all have 4 cores. It therefore uses actually 17 cores.
Any trace should do, we used a campus one. Impact of the trace is discussed in length in the [RSS++ paper][rsspp-paper], our previous work.
NPF auto-generates the graph after running the experiments. The graphs in the poster are the one directly generated by NPF.

# Reproducibility

The full data as generated by NPF, the automatically generated graphs in PDF and CSV files are available in this repository.

This command will re-generate the graphs from the NPF data cache (in the results folder) without actually running the test.
```bash
./do_graph.sh --no-test --use-last
```

If you want to run the tests yourself, you may open do\_graph.sh, change DPDK=0 as it's not strictly needed, set a path to your own campus trace,
and run the above commands without the arguments.

### Variance
The first experiment analyses the variance among server, and is generated using the first npf-compare line of do\_graph.sh

### Throughput
The second experiment analyses the throughput the 4 servers of 4 cores can handle with the various load balancing techniques. It is generated by the second npf-compare line of do\_graph.sh

## Citing our poster

If you use CrossRSS in any context, please cite our [poster extended abstract][crossrss-poster]:

```bibtex
@inproceedings{barbette2020stateless,
  title={Stateless CPU-aware datacenter load-balancing},
  author={Barbette, Tom and Chiesa, Marco and Maguire Jr, Gerald Q and Kosti{\'c}, Dejan},
  booktitle={Proceedings of the 16th International Conference on emerging Networking EXperiments and Technologies},
  pages={548--549},
  year={2020},
  month = dec,
}
```

## Getting Help

If you have any questions regarding our code or the paper, you can contact [Tom Barbette][barbette-page] (barbette at kth.se).

[crossrss-poster]: https://dl.acm.org/doi/abs/10.1145/3386367.3431672
[conext20-page]: https://conferences2.sigcomm.org/co-next/2020/#!/home
[npf-repo]: https://github.com/tbarbette/npf
[npf-readme]: https://github.com/tbarbette/npf#network-performance-framework
[fastclick-repo]: https://github.com/tbarbette/fastclick
[barbette-page]: https://www.tombarbette.be
[rsspp-paper]: https://dl.acm.org/doi/10.1145/3359989.3365412
