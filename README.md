# eusurdfwrl

![room73b2.png](images/room73b2.png)

## How to Build

First, install simtrans

for ubuntu18
```
cd /tmp
git clone https://github.com/fkanehiro/simtrans
cd simtrans
sudo pip install -r requirements.txt
sudo python setup.py install
```

for ubuntu20
```
cd /tmp
git clone https://github.com/Naoki-Hiraoka/simtrans -b ubuntu20
cd simtrans
sudo pip install -r requirements.txt
sudo python setup.py install
```
/usr/local/lib/python3.8/dist-packages/collada/resources/__init__.py を、https://github.com/pycollada/pycollada/blob/v0.9/collada/resources/__init__.py のバージョンに戻す. (とりあえず手編集)

Then, build eusurdfwrl
```
cd catkin_ws
rosdep install -r --from-paths src --ignore-src -y
catkin build eusurdfwrl
```

## How to use

```
rtmlaunch hrpsys_choreonoid_tutorials jaxon_red_choreonoid.launch LOAD_OBJECTS:=true ENVIRONMENT_YAML:=`rospack find eusurdfwrl`/worlds/room73b2.yaml
```
原点にドアがあるため、ロボットの初期位置をずらしておく必要がある

## Conversion

`eusurdf/models/*/model.urdf` -> `eusurdfwrl/models/*.wrl`

`eusurdf/worlds/*.world` -> `eusurdfwrl/worlds/*.yaml` (loadable by `hrpsys_choreonoid/launch/add_objects.py`)