#!/bin/sh
# Mona Sobhani, ####msobhani(at)usc(dot)edu####
#Non-linear transform of structural brain to standard brain
fnirt --ref=/usr/share/fsl/data/standard/MNI152_T1_2mm --in=host/pyMVPA/S20/mprage --aff=host/pyMVPA/S20/reg/highres2standard.mat --cout=host/pyMVPA/S20/highres2standard_warp -v

#Inverse of that previous file. cd into the directory where these files are held.
cd host/pyMVPA/S20
invwarp --ref==mprage --warp=highres2standard_warp --out=highres2standard_warp_inv -v --force

#Warp the ROI in standard space into the Subject's functional space
cd 
cd host
echo ROI 1
applywarp --ref=pyMVPA/S20/example_func --in=pyMVPA/IFG_parsO_25 --warp=pyMVPA/S20/highres2standard_warp_inv --postmat=pyMVPA/S20/reg/highres2example_func.mat --out=pyMVPA/S20/IFG_parsO_25_subjspace

echo ROI 2
applywarp --ref=pyMVPA/S20/example_func --in=pyMVPA/IFG_parsT_20 --warp=pyMVPA/S20/highres2standard_warp_inv --postmat=pyMVPA/S20/reg/highres2example_func.mat --out=pyMVPA/S20/IFG_parsT_20_subjspace

echo ROI 3
applywarp --ref=pyMVPA/S20/example_func --in=pyMVPA/IPL_PFcm_L_5 --warp=pyMVPA/S20/highres2standard_warp_inv --postmat=pyMVPA/S20/reg/highres2example_func.mat --out=pyMVPA/S20/IPL_PFcm_L_5_subjspace

echo ROI 4
applywarp --ref=pyMVPA/S20/example_func --in=pyMVPA/IPL_PFcm_R_5 --warp=pyMVPA/S20/highres2standard_warp_inv --postmat=pyMVPA/S20/reg/highres2example_func.mat --out=pyMVPA/S20/IPL_PFcm_R_5_subjspace

cd


