To run this code open PCurtis_Postural_Tremor_Sensitivity_Analysis.m, make the selections you want according to the comments there and run it.
The plotting scripts will plot data that is already saved in the directory.
The full model (15x7) will take about 3.5 hours to run if you load the transfer function matrix. If you try to calculate T2 for the full system
it may take much longer. Typically you want to run to the calculation of the transfer function matrix, then save it and load it for all future runs.
You only need to calculate the transfer function matrix once.