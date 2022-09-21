transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/flopr.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/fetch.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/execute.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/alu.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/adder.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/sl2.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/signext.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/regfile.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/mux2.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/maindec.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico1 {/home/amparo/ArquiComputadoras/Practico1/imem.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico2 {/home/amparo/ArquiComputadoras/Practico2/writeback.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico2 {/home/amparo/ArquiComputadoras/Practico2/processor_arm.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico2 {/home/amparo/ArquiComputadoras/Practico2/memory.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico2 {/home/amparo/ArquiComputadoras/Practico2/decode.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico2 {/home/amparo/ArquiComputadoras/Practico2/datapath.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico2 {/home/amparo/ArquiComputadoras/Practico2/controller.sv}
vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico2 {/home/amparo/ArquiComputadoras/Practico2/aludec.sv}
vcom -93 -work work {/home/amparo/ArquiComputadoras/Practico2/dmem.vhd}

vlog -sv -work work +incdir+/home/amparo/ArquiComputadoras/Practico2 {/home/amparo/ArquiComputadoras/Practico2/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
