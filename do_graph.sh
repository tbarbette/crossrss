#/bin/bash


NPF_PATH=~/npf/

HEIGHT=1.8
${NPF_PATH}/npf-compare.py "crossrss+MODE=table:CrossRSS" "crossrss+MODE=rr:RR" "crossrss+MODE=pow2:Pow2" "crossrss+MODE=hash:HASH" --testie crossrss.testie --graph-filename crossrss-drop-dual-leg.pdf --show-full --graph-size 5 $HEIGHT --variables BLOCKING=false W=400 "TIMING_FNT=50" GEN_THREADS=8 --config n_runs=5 --config graph_legend=1 "graph_color={0,0,0,0}" --tags gdb --tags always --config graph_subplot_results={VARSERLOAD+VARtime:2} graph_min_cols=2 graph_subplot_type=subplot "var_names={VARSERLOAD:Server variance (%),VARtime:Per-core variance (%)}" graph_subplot_unique_legend=True "graph_type={barplot,barplot}" "graph_x_label=0" "var_lim={VARSERLOAD:0-12,VARtime:0-12}" graph_show_values=1 "var_format={result:%d}" "var_ticks={result:0+2+4+6+8+10+12}" var_grid="{VARtime,VARSERLOAD}" --show-serie --no-transform $@
HEIGHT=2
${NPF_PATH}/npf-compare.py "crossrss+MODE=table:CrossRSS" "crossrss+MODE=rr:RR" "crossrss+MODE=pow2:Pow2" "crossrss+MODE=hash:HASH" --testie crossrss.testie --graph-filename crossrss-drop.pdf --show-full --graph-size 5 $HEIGHT --variables BLOCKING=false W=400 "TIMING_FNT=[50-110#10]" GEN_THREADS=8 --config n_runs=1 --config graph_legend=0 --tags gdb --tags always cross $@
