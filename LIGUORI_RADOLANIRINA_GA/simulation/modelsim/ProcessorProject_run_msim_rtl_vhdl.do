transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/etudiant/Documents/LIGUORI_RADOLANIRINA_GA/FlipFlop_D.vhd}
vcom -93 -work work {/home/etudiant/Documents/LIGUORI_RADOLANIRINA_GA/FSM_detect.vhd}

