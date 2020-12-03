#/bin/bash

N_RUNS=10
DPDK=1
TRACE=/mnt/traces/campus-split/kth-morning-merged/kth-morning-merged.pcap

if [ $DPDK -eq 0 ] ; then
    REPO=crossrss-nodpdk
    TAGS=nodpdk
else
    REPO=crossrss
    TAGS=
fi

HEIGHT=1.8
npf-compare "${REPO}+MODE=table:CrossRSS" "${REPO}+MODE=rr:RR" "${REPO}+MODE=pow2:Pow2" "${REPO}+MODE=hash:HASH" --test crossrss.npf --graph-filename crossrss-variance/dual-leg.pdf --show-full --graph-size 5 $HEIGHT --variables BLOCKING=false W=400 "TIMING_FNT=50" TRACE=$TRACE GEN_THREADS=8 --config n_runs=$N_RUNS --config graph_legend=1 "graph_color={0,0,0,0}" --tags always $TAGS --config graph_subplot_results={VARSERLOAD+VARtime:2} graph_min_cols=2 graph_subplot_type=subplot "var_names={VARSERLOAD:Server variance (%),VARtime:Per-core variance (%)}" graph_subplot_unique_legend=True "graph_type={barplot,barplot}" "graph_x_label=0" "var_lim={VARSERLOAD:0-12,VARtime:0-12}" graph_show_values=1 "var_format={result:%d}" "var_ticks={result:0+2+4+6+8+10+12}" var_grid="{VARtime,VARSERLOAD}" --show-serie --no-transform --result-path results --output $@
echo "The first graph should be crossrss-variance/dual-leg-subplot0.pdf"

HEIGHT=2
npf-compare "${REPO}+MODE=table:CrossRSS" "${REPO}+MODE=rr:RR" "${REPO}+MODE=pow2:Pow2" "${REPO}+MODE=hash:HASH" --test crossrss.npf --graph-filename crossrss-drop/.pdf --show-full --graph-size 5 $HEIGHT --variables TRACE=$TRACE BLOCKING=false W=400 "TIMING_FNT=[50-110#10]" GEN_THREADS=8 --config n_runs=$N_RUNS --config graph_legend=0 --tags always cross $TAGS --result-path results --output $@

echo "The second graph should be crossrss-drop/MEANOBW.pdf"
