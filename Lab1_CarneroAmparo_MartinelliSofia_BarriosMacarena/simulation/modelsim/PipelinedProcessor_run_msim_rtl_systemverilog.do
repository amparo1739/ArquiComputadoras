transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1 {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1/imem.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1 {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1/regfile.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1 {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1/alu.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1 {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1/execute.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1 {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1/fetch.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1 {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1/flopr.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1 {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1/maindec.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1 {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/modulosP1/signext.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/writeback.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/sl2.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/processor_arm.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/mux2.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/memory.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/decode.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/datapath.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/controller.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/aludec.sv}
vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/adder.sv}
vcom -93 -work work {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/dmem.vhd}

vlog -sv -work work +incdir+/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules {/home/amparo/Escritorio/ArquiComputadoras/Lab1_CarneroAmparo_MartinelliSofia_BarriosMacarena/PipelinedProcessorPatterson-Modules/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
