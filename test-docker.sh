#!/usr/bin/env bash

docker run \
--mount type=bind,src=$(pwd -P),dst=/wkdir \
--mount type=bind,src=$(pwd -P)/INPUTS,dst=/INPUTS \
--mount type=bind,src=$(pwd -P)/OUTPUTS,dst=/OUTPUTS \
tracula-docker-test:latest \
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
