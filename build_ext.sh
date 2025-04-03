#!/bin/bash
set -e
export CPATH=$CONDA_PREFIX/include:$CPATH
export CUDA_HOME=$CONDA_PREFIX
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib:$CUDA_HOME/lib64:$LD_LIBRARY_PATH
cd freqencoder/; rm -rf build; python setup.py build_ext --inplace; mkdir _ext; mv *.so _ext; cd ..;
cd gridencoder/; rm -rf build; python setup.py build_ext --inplace; mkdir _ext; mv *.so _ext; cd ..;
cd hashencoder/; rm -rf build; python setup.py build_ext --inplace; mkdir _ext; mv *.so _ext; cd ..;
cd shencoder/;   rm -rf build; python setup.py build_ext --inplace; mkdir _ext; mv *.so _ext; cd ..;
cd raymarching/; rm -rf build; python setup.py build_ext --inplace; mkdir _ext; mv *.so _ext; cd ..;
