import QtQuick 2.15

Rectangle {
    id: lowAlert
    color: "black"
    opacity: 0.85
    anchors.fill: parent

    Rectangle {
        id: lowAlertCard
        width: 600
        height: 380
        color: "black"
        anchors.centerIn: parent
        radius: 20
        border.color: "gray"
        scale: 0

        Image {
            id: lowAlertIcon
            source: "qrc:/Images/lowalerticon.png"
            scale: 0.7
            anchors.horizontalCenter: parent.horizontalCenter
        }
        // Card Animation
        SequentialAnimation {
            id: idAnimation
            PropertyAnimation {
                property: "scale"
                target: lowAlertCard
                to: 0.1
                duration: 300
            }

            PropertyAnimation {
                property: "scale"
                target: lowAlertCard
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
                target: lowAlertIcon
                to: 0.1
                duration: 400
            }

            PropertyAnimation {
                property: "scale"
                target: lowAlertIcon
                to: 0.7
                duration: 500
            }
            running: true
        }
        Item {
            anchors {
                bottom: lowAlertIcon.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: 30
            }

            // Timer color rectangles
            Rectangle {
                id: colorTimer1
                width: 20
                height: 10
                color: "transparent"
                border.color: "green"
                radius: 3
            }

            Rectangle {
                id: colorTimer2
                width: colorTimer1.width
                height: colorTimer1.height
                color: "transparent"
                border.color: "green"
                anchors.left: colorTimer1.right
                radius: 3
            }

            Rectangle {
                id: colorTimer3
                width: colorTimer1.width
                height: colorTimer1.height
                color: "transparent"
                border.color: "green"
                anchors.right: colorTimer1.left
                radius: 3
            }

            Rectangle {
                id: colorTimer4
                width: colorTimer1.width
                height: colorTimer1.height
                color: "transparent"
                border.color: "green"
                anchors.left: colorTimer2.right
                radius: 3
            }

            Rectangle {
                id: colorTimer5
                width: colorTimer1.width
                height: colorTimer1.height
                color: "transparent"
                border.color: "green"
                anchors.right: colorTimer3.left
                radius: 3
            }

            // Timer color animation
            SequentialAnimation {
                id: colorAnimation
                running: false

                ColorAnimation {
                    target: colorTimer5
                    property: "color"
                    from: "transparent"
                    to: "green"
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                ColorAnimation {
                    target: colorTimer3
                    property: "color"
                    from: "transparent"
                    to: "green"
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                ColorAnimation {
                    target: colorTimer1
                    property: "color"
                    from: "transparent"
                    to: "green"
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                ColorAnimation {
                    target: colorTimer2
                    property: "color"
                    from: "transparent"
                    to: "green"
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                ColorAnimation {
                    target: colorTimer4
                    property: "color"
                    from: "transparent"
                    to: "green"
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                onRunningChanged: {
                    if (!running && monitor.lowAlertActive) {
                        monitor.deactivateLowAlert()
                    }
                }
            }
        }

        Text {
            id: lowAlertMass
            text: qsTr("Please Stay Focused")
            color: "white"
            font {
                family: fontbold.name
                pixelSize: 36
            }
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 60
            }
        }
    }

    // Connections to Monitor signals
    Connections {
        target: monitor
        onLowAlertActiveChanged: {
            if (monitor.lowAlertActive) {
                colorAnimation.running = true
            } else {
                colorAnimation.running = false
            }
        }
    }
}
