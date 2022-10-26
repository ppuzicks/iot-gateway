cmake_minimum_required(VERSION 3.14)

PROJECT(le-gateway)
SET(LICENSE "MIT")

SET(CMAKE_VERBOSE_MAKEFILE ON)

SET(CMAKE_CXX_STANDARD 17)

#FIND_PACKAGE(PkgConfig REQUIRED)
##pkg_check_modules(BLUEZ REQUIRED bluez)
#pkg_check_modules(GPIODCXX REQUIRED libgpiodcxx)
#pkg_check_modules(OPENSSL REQUIRED openssl)
#pkg_check_modules(SDBUSCPP REQUIRED sdbus-c++)

FILE(GLOB SOURCES "*.c*")

ADD_EXECUTABLE(le-gateway ${SOURCES})

#TARGET_INCLUDE_DIRECTORIES(spacenorm PUBLIC 
#  ${BLUEZ_INCLUDE_DIRS}
#  ${GPIODCXX_INCLUDE_DIRS}
#  ${OPENSSL_INCLUDE_DIRS}
#  ${SDBUSCPP_INCLUDE_DIRS})

#TARGET_COMPILE_OPTIONS(spacenorm PUBLIC
#  "-D_WEBSOCKETPP_CPP11_STL_"
#  ${BLUEZ_CFLAGS_OTHER}
#  ${GPIODCXX_CFLAGS_OTHER}
#  ${OPENSSL_CFLAGS_OTHER}
#  ${SDBUSCPP_CFLAGS_OTHER})

TARGET_LINK_LIBRARIES(le-gateway 
  stdc++
  pthread 
#  atomic
#  ubus
#  ubox
#  blobmsg_json
#  curl
#  curlcpp
#  boost_system
#  boost_serialization
#  ${BLUEZ_LIBRARIES}
#  ${GPIODCXX_LIBRARIES}
#  ${OPENSSL_LIBRARIES}
#  ${SDBUSCPP_LIBRARIES}
)

INSTALL(TARGETS le-gateway DESTINATION bin)