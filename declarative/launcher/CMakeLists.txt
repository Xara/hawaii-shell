set(SOURCES
    launcheritem.cpp
    launchermodel.cpp
    launcherplugin.cpp
)

add_library(launcherplugin SHARED ${SOURCES})
target_link_libraries(launcherplugin
                      Qt5::Qml
                      Qt5::Quick
                      KF5::Service)

install(FILES qmldir
    DESTINATION ${QML_INSTALL_DIR}/org/hawaii/launcher)
install(TARGETS launcherplugin
    DESTINATION ${QML_INSTALL_DIR}/org/hawaii/launcher)