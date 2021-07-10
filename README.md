# eusurdfwrl

![room73b2.png](images/room73b2.png)

## How to Build

First, install simtrans
```
git clone https://github.com/fkanehiro/simtrans
cd simtrans
sudo pip install -r requirements.txt
sudo python setup.py install
```

Then, build eusurdfwrl
```
rosdep install -r --from-paths . --ignore-src -y
sudo apt install libcanberra-gtk-module #dependency of meshlab
catkin build eusurdfwrl
```

## How to use

```
rtmlaunch hrpsys_choreonoid_tutorials jaxon_jvrc_choreonoid.launch LOAD_OBJECTS:=true ENVIRONMENT_YAML:=`rospack find eusurdfwrl`/worlds/room73b2.yaml
```
原点にドアがあるため、ロボットの初期位置をずらしておく必要がある

## Conversion

`eusurdf/models/*/model.urdf` -> `eusurdfwrl/models/*.wrl`

`eusurdf/worlds/*.world` -> `eusurdfwrl/worlds/*.yaml` (loadable by `hrpsys_choreonoid/launch/add_objects.py`)