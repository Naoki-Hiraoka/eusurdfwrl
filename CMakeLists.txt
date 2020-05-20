cmake_minimum_required(VERSION 3.0.2)
project(eusurdfwrl)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED)

catkin_package(
)

ExternalProject_Add(simtrans
  GIT_REPOSITORY https://github.com/fkanehiro/simtrans
  CONFIGURE_COMMAND
  BUILD_COMMAND
  INSTALL_COMMAND python setup.py install --prefix
  )
