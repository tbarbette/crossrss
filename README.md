# CrossRSS: Stateless CPU-aware datacenter load-balancing

This repository contains information/source code to perform the experiments done in [CrossRSS][crossrss-poster] published at [CoNEXT'20][conext20-page].

## Experiments

**Note that you have to setup your testbed based on [our guidelines](TESTBED.md) before running any experiment.**

## Citing our paper

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
[dpdk-page]:https://www.dpdk.org/
[testpmd-doc]: https://doc.dpdk.org/guides/testpmd_app_ug/intro.html
[fastclick-repo]: https://github.com/tbarbette/fastclick
[barbette-page]: https://www.tombarbette.be
