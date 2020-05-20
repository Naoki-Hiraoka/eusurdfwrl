#!/bin/sh

# -b : use both visual and collision
# -e 8: estimate mass and inertia from bounding box. SPGR = 8
CMD="simtrans -b -e 100"

EUSURDF_DIR=`rospack find eusurdf`
EUSURDFWRL_DIR=`rospack find eusurdfwrl`
GAZEBO_MODEL_PATH=`rospack find eusurdf`/models:$GAZEBO_MODEL_PATH

# convert .world
ls $EUSURDF_DIR/worlds | grep .world | sed -e "s/.world//" | xargs -P 8 -I@ sh -c "echo @ && python convertworld.py $EUSURDF_DIR/worlds/@.world $EUSURDFWRL_DIR/worlds/@.yaml";

# convert model.urdf
ls $EUSURDF_DIR/models | xargs -P 16 -I@ sh -c "echo @ && $CMD -i $EUSURDF_DIR/models/@/model.urdf -o $EUSURDFWRL_DIR/models/@.wrl";
