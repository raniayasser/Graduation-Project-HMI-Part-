# QT += quick

# # You can make your code fail to compile if it uses deprecated APIs.
# # In order to do so, uncomment the following line.
# #DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# SOURCES += \
#         imageprovider.cpp \
#         main.cpp \
#         phonecallmanager.cpp \
#         testsignalsspotss.cpp

# RESOURCES += qml.qrc

# # Additional import path used to resolve QML modules in Qt Creator's code model
# QML_IMPORT_PATH =

# # Additional import path used to resolve QML modules just for Qt Quick Designer
# QML_DESIGNER_IMPORT_PATH =

# # Default rules for deployment.
# qnx: target.path = /tmp/$${TARGET}/bin
# else: unix:!android: target.path = /opt/$${TARGET}/bin
# !isEmpty(target.path): INSTALLS += target

# HEADERS += \
#     imageprovider.h \
#     phonecallmanager.h \
#     testsignalsspotss.h
############################################################################################################################
########################################################################################################################3333
QT += quick core gui multimedia positioning network

CONFIG += c++11


LIBS += -LD:\opencv\build\x64\vc16\lib -lopencv_world4100
LIBS += -LD:\opencv\build\x64\vc16\bin -lopencv_world4100

CONFIG(debug, debug|release) {
    LIBS += -lopencv_world4100d
}
CONFIG(release, debug|release) {
    LIBS += -lopencv_world4100
}

INCLUDEPATH += D:\opencv\build\include
DEPENDPATH += D:\opencv\build\include


SOURCES += \
    imageclient.cpp \
    main.cpp \
    monitor.cpp \
    tcpserver.cpp \
    udp_receiver.cpp


HEADERS += \
    imageclient.h \
    monitor.h \
    tcpserver.h \
    udp_receiver.h


RESOURCES += qml.qrc

