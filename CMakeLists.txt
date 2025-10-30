cmake_minimum_required(VERSION 2.8.3)
project(eusurdfwrl)

find_package(catkin REQUIRED)

catkin_package()

if("$ENV{ROS_DISTRO}" STRLESS_EQUAL "melodic")
  find_package(catkin_virtualenv)
  catkin_generate_virtualenv()
else()
  add_custom_target(${PROJECT_NAME}_generate_virtualenv)
endif()

catkin_install_python(
  PROGRAMS scripts/convertworld.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

include(cmake/eusurdfwrl.cmake)
convert_urdf_to_wrl()
convert_gazebo_world_to_environment_yaml()

if("$ENV{ROS_DISTRO}" STRLESS_EQUAL "melodic")
  install(FILES requirements.txt
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
endif()
