import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15
import QtQuick.Layouts 1.15

Rectangle {
    id: debugMode
    width: 710
    height: 440
    color: "black"
    border.color: "gray"
    x: 85

    Rectangle {
        id: sideRight
        height: debugMode.height
        width: debugMode.width / 4
        color: "#000000"
        border.color: "white"
        opacity: 0.8

        Text {
            id: debowsyTitle
            text: qsTr("Drowsy Level")
            color: "#fdd835"
            anchors.horizontalCenter: sideRight.horizontalCenter
            y: 10
            font.pixelSize: 18
        }

        Rectangle {
            id: debowsyLevel
            width: sideRight.width - 20
            height: 35
            radius: 20
            y: 40
            color: "#191C28"
            anchors.horizontalCenter: sideRight.horizontalCenter

            Rectangle {
                id: col
                width: debowsyLevel.width * (monitor.drowsyLevel / 100.0)
                height: parent.height
                color: "#1FEF28"
                radius: 20
            }
        }

        Text {
            id: destractionTitle
            text: qsTr("Distraction Level")
            color: "#fdd835"
            anchors.horizontalCenter: sideRight.horizontalCenter
            y: 90
            font.pixelSize: 18
        }

        Rectangle {
            id: destrectionlevel
            width: parent.width - 20
            height: 35
            radius: 20
            anchors.horizontalCenter: parent.horizontalCenter
            y: 120
            color: "#191C28"

            Rectangle {
                id: col2
                width: destrectionlevel.width * (monitor.drowsyLevel / 100.0)
                height: parent.height
                color: "#1FEF28"
                radius: 20
            }
        }

        Text {
            id: debowsytxt
            text: monitor.drowsyLevel + "%"
            color: "#ffffff"
            anchors.centerIn: debowsyLevel
            font.pixelSize: 20
            font.bold: true
        }

        Text {
            id: destraction
            text: monitor.drowsyLevel + "%"
            color: "#ffffff"
            anchors.centerIn: destrectionlevel
            font.pixelSize: 20
            font.bold: true
        }

        Rectangle {
            id: line1
            width: sideRight.width - 20
            height: 1
            anchors.horizontalCenter: sideRight.horizontalCenter
            y: 170
            color: "#757575"
        }

        Text {
            id: eyestuts
            text: qsTr("Eye Status")
            color: "#fdd835"
            anchors.horizontalCenter: sideRight.horizontalCenter
            y: 180
            font.pixelSize: 18
        }

        Image {
            id: leftEye
            width: 40
            height: 40
            y: 210
            x: 30
            source: {
                monitor.leftEye === "closed" ? "qrc:/Images/a2.png" : "qrc:/Images/eyeopen.png"
            }
        }

        Image {
            id: rightEye
            width: leftEye.width
            height: leftEye.height
            y: leftEye.y
            x: 100
            source: {
                monitor.rightEye === "closed" ? "qrc:/Images/a2.png" : "qrc:/Images/eyeopen.png"
            }
        }

        Rectangle {
            id: line2
            width: sideRight.width - 20
            height: 1
            anchors.horizontalCenter: sideRight.horizontalCenter
            y: 260
            color: "#757575"
        }

        Text {
            id: moysestuts
            text: qsTr("Mouth Status")
            color: "#fdd835"
            anchors.horizontalCenter: sideRight.horizontalCenter
            y: 270
            font.pixelSize: 18
        }

        Image {
            id: mouthIcon
            width: 60
            height: 60
            y: 300
            anchors.horizontalCenter: sideRight.horizontalCenter

            source: {
                monitor.mouthState === "open" ? "qrc:/Images/mouthOpen2.png" : "qrc:/Images/a3.png"
            }
        }
    }

    Rectangle {
        id: line3
        width: sideRight.width - 20
        height: 1
        x: 10
        y: 360
        color: "#757575"
    }

    Text {
        id: hEADDIR
        text: qsTr("HEAD DIR (PRY)")
        color: "#fdd835"
        anchors.horizontalCenter: sideRight.horizontalCenter
        y: 375
        font.pixelSize: 18
    }

    Text {
        id: angels
        text: qsTr("+7°  +20°  +2°")
        color: "#1FEF28"
        anchors.horizontalCenter: sideRight.horizontalCenter
        y: 405
        font.family: iclandFont.name
        font.pixelSize: 22
    }

    Rectangle {
        id: livecamera
        width: 500
        height: 370
        y: 20
        x: debugMode.width - 520
        color: "black"
        border.color: "white"

        Image {
            id: cameraImage
            anchors.fill: parent
            source: udpReceiver.imageSource // Bind to the image source property
            fillMode: Image.PreserveAspectCrop
        }
    }

    // Image {
    //     id: cameraImage
    //     width: livecamera.width
    //     height: livecamera.height
    //     source: ""
    //     fillMode: Image.PreserveAspectFit
    // }

    // ImageClient {
    //     id: imageClient

    //     onImageReceived: {
    //         cameraImage.source = imagePath
    //     }

    //     Component.onCompleted: {
    //         startTcpClient()
    //     }
    // }
    Text {
        id: title
        text: qsTr("Driver Monitoring System")
        color: "white"
        font.pixelSize: 32
        font.family: iclandFont.name
        anchors {
            bottom: livecamera.bottom
            horizontalCenter: livecamera.horizontalCenter
            bottomMargin: -40
        }
        Rectangle {
            width: 10
            height: 10
            color: "green"
            radius: 5
            anchors {
                right: title.left
                verticalCenter: title.verticalCenter
                rightMargin: 5
            }
        }
        Rectangle {
            width: 10
            height: 10
            color: "green"
            radius: 5
            anchors {
                left: title.right
                verticalCenter: title.verticalCenter
                leftMargin: 5
            }
        }
    }

    Image {
        id: closeIcon
        width: 30
        height: 30
        source: "qrc:/Images/closew.png"
        anchors {
            top: debugMode.top
            right: debugMode.right
            margins: 5
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                debugPageVisiable = false
            }
        }
    }
}
