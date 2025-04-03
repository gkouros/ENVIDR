#!/bin/bash

set -e

SCENE=$1

export CPATH=$CONDA_PREFIX/include:$CPATH
export CUDA_HOME=$CONDA_PREFIX
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib:$CUDA_HOME/lib64:$LD_LIBRARY_PATH

# train model on scene
python main_nerf.py --config ./configs/scenes/$SCENE.ini

# extract envmap
# Note you need to manually tune unwrap_roughness to get a clear & detailed environment map.
python main_nerf.py --config configs/unwrap_scene.ini \
    --workspace logs/$SCENE --swap_env_path logs/$SCENE/checkpoints/ngp_ep0500.pth \
    --unwrap_color_intensity=1.0 --unwrap_roughness=0.4


