#!/usr/bin/env bash

singularity exec --cleanenv --contain \
--bind $(pwd -P):/wkdir \
--bind $(pwd -P)/INPUTS:/INPUTS \
--bind $(pwd -P)/OUTPUTS:/OUTPUTS \
--bind $(pwd -P)/freesurfer_license.txt:/opt/freesurfer-7.2.0/.license \
baxterprogers/tracula-docker:v0.0.0 \
bash -c ' \
ls /INPUTS && \
ls /OUTPUTS && \
echo "setenv SUBJECTS_DIR /INPUTS" > /OUTPUTS/tracula.config && \
echo "set dtroot = (/OUTPUTS/TRACULA)" >> /OUTPUTS/tracula.config && \
echo "set subjlist = (SUBJECT)" >> /OUTPUTS/tracula.config && \
echo "set dcmroot = (/INPUTS/PREPROCESSED)" >> /OUTPUTS/tracula.config && \
echo "set dcmlist = (dwmri.nii.gz)" >> /OUTPUTS/tracula.config && \
echo "set bveclist = (dwmri.bvec)" >> /OUTPUTS/tracula.config && \
echo "set bvallist = (dwmri.bval)" >> /OUTPUTS/tracula.config && \
echo "set dob0 = 0" >> /OUTPUTS/tracula.config && \
echo "set doeddy = 0" >> /OUTPUTS/tracula.config && \
trac-all -prep -c /OUTPUTS/tracula.config && \
trac-all -bedp -c /OUTPUTS/tracula.config && \
trac-all -path -c /OUTPUTS/tracula.config \
'
