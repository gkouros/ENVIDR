#!/bin/bash

set -e

SCENE=$1

# train model on scene
python main_nerf.py --config ./configs/scenes/$SCENE.ini

# extract envmap
# Note you need to manually tune unwrap_roughness to get a clear & detailed environment map.
python main_nerf.py --config configs/unwrap_scene.ini \
    --workspace logs/$SCENE --swap_env_path logs/$SCENE/checkpoints/ngp_ep0500.pth \
    --unwrap_color_intensity=1.0 --unwrap_roughness=0.4


