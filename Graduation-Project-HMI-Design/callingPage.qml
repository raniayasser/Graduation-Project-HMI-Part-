import QtQuick 2.15

Rectangle {
    id: calling
    width: 730
    height: 480
    color: "black"
    opacity: 0.95

    Image {
        id: friendIcon
        width: 65
        height: 65
        y: calling.height / 4
        source: "qrc:/Images/user (1).png"
        anchors {
            horizontalCenter: calling.horizontalCenter
        }
    }
    Rectangle {
        id: friendName
        x: calling.width / 3
        anchors {
            bottom: friendIcon.bottom
        }

        Image {
            id: callIcon2
            width: 50
            height: 50
            // y:calling.height/4
            source: "qrc:/Images/callingicon.png"
            anchors {
                right: callingTxt.left

                rightMargin: 20
            }
        }

        Text {
            id: callingTxt
            // y:calling.height/2.3
            text: qsTr("Calling Your Friend...")
            color: "white"
            font {
                pixelSize: 28
                family: font2.name
            }

            anchors.verticalCenter: callIcon2.verticalCenter
            anchors.bottomMargin: -20
        }
    }

    Image {
        id: discalling
        width: 65
        height: 65
        y: calling.height / 1.5
        rotation: 135
        source: "qrc:/Images/discalling.png"
        anchors {
            horizontalCenter: calling.horizontalCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                callingPageVisiable = false
                // callIconSelected = false
            }
        }
    }
}
