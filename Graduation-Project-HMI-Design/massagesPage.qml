import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: massegesPagee
    width: 730
    height: 400
    color: "black"
    opacity: 0.95
    anchors.leftMargin: 50

    Rectangle {
        id: music
        width: 540
        height: 350
        y: 30
        x: 70
        radius: 10
        color: "#0C0D0E"

        Image {
            id: musicp
            width: 540
            height: 170

            source: "qrc:/Images/ariana-grande-.png"
            anchors {// horizontalCenter:parent.horizontalCenter
            }

            Rectangle {
                id: def
                width: 160
                height: 38
                color: "white"
                opacity: 0.1
                anchors.bottom: parent.bottom
                anchors.left: parent.left
            }

            Text {
                id: text1
                text: qsTr("Everyday")
                color: "white"

                y: 137

                font.bold: true
                font.pixelSize: 12
            }

            Text {
                id: text2
                text: qsTr("Ariana Grande")
                color: "white"

                anchors.bottom: parent.bottom
                anchors.left: parent.left

                font.pixelSize: 11
            }
        }

        Rectangle {
            id: sound
            width: 460
            height: 10
            color: "#242528"

            x: 40
            y: 220
            radius: 10
        }
        Rectangle {
            id: sound2
            width: 100
            height: 10
            color: "white"

            x: 40
            y: 220
            radius: 10
        }

        Rectangle {
            id: sound3
            width: 20
            height: 20
            color: "black"

            x: 130
            y: 214
            radius: 90
        }

        Rectangle {
            id: sound4
            width: 5
            height: 5
            color: "white"

            x: 137
            y: 222
            radius: 90
        }

        Rectangle {
            id: sound5
            width: 50
            height: 50
            color: "#242528"

            x: 250
            y: 270
            radius: 60
        }

        Text {
            id: time1
            text: qsTr("1:09")
            color: "white"

            x: 40
            y: 240

            font.pixelSize: 11
        }

        Text {
            id: time2
            text: qsTr("3:54")
            color: "white"
            x: 470
            y: 240
            font.pixelSize: 11
        }

        Image {
            id: musicop
            width: 20
            height: 20

            x: 264
            y: 286
            source: "qrc:/Images/Group 4.png"
            anchors {// horizontalCenter:parent.horizontalCenter
            }
        }

        Image {
            id: musicr
            width: 20
            height: 20
            x: 365
            y: 285

            source: "qrc:/Images/sound (1).png"
            anchors {// horizontalCenter:parent.horizontalCenter
            }
        }

        Image {
            id: musicl
            width: 20
            height: 20

            x: 165
            y: 285
            source: "qrc:/Images/sound2.png"
            anchors {// horizontalCenter:parent.horizontalCenter
            }
        }
    }

    // Rectangle {
    //     id: notFoundCard
    //     width: 400
    //     height: 300
    //     color: "black"
    //     anchors.centerIn: massegesPagee
    //     radius: 20
    //     border.width: 1
    //     border.color: "gray"
    //     // Card Animation
    //     SequentialAnimation {
    //         id: idcnimation
    //         PropertyAnimation {
    //             property: "scale"
    //             target: notFoundCard
    //             to: 0.1
    //             duration: 500
    //         }

    //         PropertyAnimation {
    //             property: "scale"
    //             target: notFoundCard
    //             to: 1
    //             duration: 500
    //         }
    //         running: true
    //     }

    //     Text {
    //         id: lowAlertMass

    //         text: qsTr("This Application Not Found ")
    //         color: "white"

    //         font {
    //             // family: fontbold.name
    //             pixelSize: 24
    //             bold: true
    //         }
    //         anchors {
    //             centerIn: notFoundCard
    //         }
    //     }
    // }
    Image {
        id: closeIcon
        width: 30
        height: 30
        source: "qrc:/Images/close.png"
        anchors {
            top: massegesPagee.top
            right: massegesPagee.right
            margins: 5
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                massegesPageVisable = false
            }
        }
    }
}
