import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    visible: true
    width: 640
    height: 480

    Rectangle {
        id: highAlertPage
        width: parent.width
        height: parent.height
        color: "black"
        opacity: 0.85
        anchors.centerIn: parent

        Rectangle {
            id: highAlertCard
            width: 600
            height: 380
            color: "black"
            border.color: "gray"
            scale: 0
            radius: 20
            anchors.centerIn: parent

            Image {
                id: highAlertIcon
                source: "qrc:/Images/highalerticon.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
            }

            // Card Animation
            SequentialAnimation {
                id: idAnimation
                PropertyAnimation {
                    property: "scale"
                    target: highAlertCard
                    to: 0.1
                    duration: 300
                }

                PropertyAnimation {
                    property: "scale"
                    target: highAlertCard
                    to: 1
                    duration: 500
                }
                running: true
            }
            // Icon Animation
            SequentialAnimation {
                id: aAnimation
                loops: Animation.Infinite
                PropertyAnimation {
                    property: "scale"
                    target: highAlertIcon
                    to: 0.1
                    duration: 400
                }

                PropertyAnimation {
                    property: "scale"
                    target: highAlertIcon
                    to: 0.7
                    duration: 500
                }
                running: true
            }
            Text {
                id: highAlertMass
                text: qsTr("Please be careful, you are in danger")
                color: "white"
                font.pixelSize: 28
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: highAlertIcon.bottom
                // anchors.topMargin: 20
            }

            Rectangle {
                id: closeAlertBtn
                width: parent.width / 2
                height: 40
                color: "darkGreen"
                radius: 20
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                MouseArea {
                    anchors.fill: parent
                    onClicked: {

                        monitor.closeHighAlert()
                    }
                }

                Text {
                    text: qsTr("Close Alert")
                    color: "#F9F9F9"
                    font.pixelSize: 24
                    anchors.centerIn: parent
                }
            }
        }
    }
}
