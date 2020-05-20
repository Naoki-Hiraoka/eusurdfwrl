# eusurdfwrl

Setup
```
rosdep install -r --from-paths . --ignore-src -y
catkin build eusurdfwrl
```

Install simtrans
```
git clone https://github.com/fkanehiro/simtrans
cd simtrans
sudo pip install -r requirements.txt
sudo python setup.py install
```

Convert models
```
cd scripts
./convertall.sh
```

eusurdf/models/\*/model.urdf -> eusurdfwrl/models/\*.wrl

eusurdf/worlds/\*.world -> eusurdfwrl/worlds/\*.yaml (loadable by hrpsys_choreonoid/launch/add_objects.py)