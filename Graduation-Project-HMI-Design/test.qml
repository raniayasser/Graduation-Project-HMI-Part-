import QtQuick 2.15
import QtQuick.Controls 2.12

Item {
    // width: 710
    // height: 480

    // Button {
    //     anchors.centerIn: parent
    //     text: "Make a Call"
    //     onClicked: {

    //         myCppObject.makePhoneCall("+20102077200")
    //     }
    // }
} // import Monty 1.0

/*Rectangle {
    width: 450
    height: 480
    color: "red"

    // TestSignalSspotss {
    //     id: calling11
    // }
    Connections {
        target: classA
        onSomeVarChanged: myLabel.text = classA.getSomeVar()
    }
    Button {
        width: 100
        height: 100
        anchors.centerIn: parent
        text: "click me"
        onClicked: classA.setSomeVar("ABC")
    }
    Text {
        id: myLabel
        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 20
        }
        font.pixelSize: 24
        text: classA.getSomeVar()
    }
}*/ // Rectangle {//     id: debugMode//     width: 730//     height: 480
//     gradient: Gradient {
//         GradientStop {
//             position: -0.9
//             color: "#666666"
//         }

//         GradientStop {
//             position: 1.0
//             color: "black"
//         }
//     }

//     Rectangle {
//         id: sideRight
//         height: debugMode.height
//         width: debugMode.width / 4
//         color: "#000000"
//         opacity: 0.6
//         radius: 5

//         Rectangle {
//             id: destrectionlevel
//             width: sideRight.width - 50
//             height: 50
//             radius: 20
//             x: 25
//             y: 80

//             //     anchors{
//             //    horizontalCenter: sideRight.horizontalCenter
//             //   }
//         }

//         Rectangle {
//             id: line1
//             width: sideRight.width
//             height: 1
//             anchors.bottom: destrectionlevel.bottom
//             anchors.bottomMargin: -30
//             color: "#757575"
//         }
//     }
//     Rectangle {
//         id: drowsyTxt
//         anchors.horizontalCenter: debowsyLevel.horizontalCenter

//         Rectangle {
//             id: debowsyLevel
//             width: sideRight.width - 50
//             height: 50
//             radius: 20
//             y: 10
//             opacity: 0.5
//             anchors {
//                 horizontalCenter: sideRight.horizontalCenter
//             }
//             Rectangle {
//                 id: col
//                 width: sideRight.width - 150
//                 height: 50
//                 color: "#1FEF28"
//                 radius: 20
//             }
//         }
//         Text {
//             id: debowsytxt
//             text: qsTr("7%")
//             color: "#ffffff"
//             font.pixelSize: 20
//             font.bold: true
//         }
//         Text {
//             id: debowsywrite
//             text: qsTr("DROWSY LEVEL")
//             color: "#fdd835"

//             font.pixelSize: 12
//         }
//     }

//     Text {
//         id: destraction
//         text: qsTr("5%")
//         color: "#ffffff"
//         x: 111
//         y: 94

//         font.pixelSize: 20
//         font.bold: true
//     }
//     Text {
//         id: destractionwrite
//         text: qsTr("DISTRACTION LEVEL")
//         color: "#fdd835"
//         x: 70
//         y: 120

//         font.pixelSize: 12
//     }

//     Rectangle {
//         id: eyeStatus
//         color: "red"
//         anchors.horizontalCenter: sideRight.horizontalCenter
//         anchors.bottom: line1.bottom
//         Text {
//             id: eyestuts
//             text: qsTr("Eye Status")
//             color: "#fdd835"
//             font.pixelSize: 18
//         }

//         Image {
//             id: openeye
//             width: 50
//             height: 50
//             source: "qrc:/Images/eyeopen.png"
//         }
//         Image {
//             id: closeeye
//             width: 50
//             height: 50
//             source: "qrc:/Images/a2.png"
//         }

//         Rectangle {
//             id: line2
//             width: sideRight.width
//             height: 1
//             anchors.bottom: closeeye.bottom
//             anchors.bottomMargin: -30
//             color: "#757575"
//         }
//     }

//     Rectangle {
//         id: mouthStatus

//         Text {
//             id: moysestuts
//             text: qsTr("Mouth Status")
//             color: "#fdd835"
//             x: 72
//             y: 280

//             font.pixelSize: 18
//         }
//         Image {
//             id: mouse
//             width: 70
//             height: 70
//             y: 300
//             x: 90

//             source: "qrc:/Images/a3.png"
//             anchors {//   horizontalCenter:parent.horizontalCenter
//             }
//         }

//         Rectangle {
//             id: line3
//             width: 220
//             height: 1
//             x: 10
//             y: 370

//             color: "#757575"
//         }
//     }

//     Text {
//         id: hEADDIR
//         text: qsTr("HEAD DIR (PRY)")
//         color: "#fdd835"
//         x: 55
//         y: 385

//         font.pixelSize: 18
//     }

//     Text {
//         id: angels
//         text: qsTr("+7°      +20°       +2°")
//         color: "#1FEF28"
//         x: 30
//         y: 420

//         font.pixelSize: 18
//     }
//     Item {
//         Rectangle {
//             id: livecamera
//             width: 430
//             height: 380

//             x: 260
//             y: 30
//             // anchors.centerIn:
//             color: "black"
//             border.color: "white"
//             Text {
//                 id: live
//                 text: qsTr("Live Camera")
//                 color: "white"
//                 font.pixelSize: 15
//                 anchors.centerIn: parent
//             }
//         }

//         Text {
//             id: title
//             text: qsTr("Driver Monitoring System")
//             color: "white"
//             font.pixelSize: 22
//             font.family: font2
//             anchors {
//                 bottom: livecamera.bottom
//                 horizontalCenter: livecamera.horizontalCenter
//                 bottomMargin: -50
//             }
//             Rectangle {
//                 width: 10
//                 height: 10
//                 color: "blue"
//                 radius: 5
//                 anchors {
//                     right: title.left
//                     verticalCenter: title.verticalCenter
//                     rightMargin: 5
//                 }
//             }
//             Rectangle {
//                 width: 10
//                 height: 10
//                 color: "blue"
//                 radius: 5
//                 anchors {
//                     left: title.right
//                     verticalCenter: title.verticalCenter
//                     leftMargin: 5
//                 }
//             }
//         }
//     }

//     // Image {
//     //     id: closeIcon
//     //     width: 30
//     //     height: 30
//     //     source: "qrc:/Images/close.png"
//     //     anchors {
//     //         top: debugMode.top
//     //         right: debugMode.right
//     //         margins: 5
//     //     }
//     //     MouseArea {
//     //         anchors.fill: parent
//     //         onClicked: {
//     //             debugPageVisiable = false
//     //         }
//     //     }
//     // }
// }
// Rectangle {
//     id: root
//     width: 800
//     height: 480

//     gradient: Gradient {
//         GradientStop {
//             position: -0.9
//             color: "#666666"
//         }
//         // GradientStop { position: 0.33; color: "black" }
//         GradientStop {
//             position: 1.0
//             color: "black"
//         }
//     }

//     // ##################### {left Navbar} ###########################################
//     Rectangle {
//         id: icons
//         height: root.height - 80
//         width: 60
//         x: 5
//         color: "transparent"
//         anchors {
//             margins: 20
//             verticalCenter: root.verticalCenter
//         }
//         border.width: 1
//         border.color: "white"
//         radius: 50
//         Rectangle {
//             id: recanimate
//             width: 60
//             height: 50
//             color: gpsPageVisiable || callingPageVisiable || debugPageVisiable
//                    || massegesPageVisable ? "gray" : "transparent"
//             opacity: 0.5
//             z: -1

//             NumberAnimation on y {

//                 id: animatee
//                 duration: 300
//                 easing.type: Easing.InOutQuad
//                 running: false
//             }
//         }

//         Image {
//             id: debugIcon
//             // source: "qrc:/Images/profile.png"
//             width: 40
//             height: 40
//             y: icons.height / 5
//             anchors.horizontalCenter: icons.horizontalCenter

//             MouseArea {
//                 anchors.fill: parent
//                 onClicked: {

//                     debugPageVisiable = true
//                     if (debugPageVisiable) {
//                         animatee.to = icons.height / 5 - 10
//                         animatee.running = true
//                         recanimate.anchors.horizontalCenter = debugIcon.horizontalCenter
//                     }
//                     //pages visability
//                     callingPageVisiable = false
//                     gpsPageVisiable = false
//                     massegesPageVisable = false
//                     debugMoodPage.anchors.right = root.right
//                 }
//             }
//         }

//         Image {

//             id: callIcon
//             source: "qrc:/Images/phone-call (2).png"
//             width: 30
//             height: 30
//             y: icons.height / 5 + 80
//             anchors.horizontalCenter: icons.horizontalCenter

//             MouseArea {
//                 anchors.fill: parent
//                 onClicked: {
//                     // callIconSelected = true
//                     callingPageVisiable = true
//                     if (callingPageVisiable) {
//                         recanimate.anchors.horizontalCenter = callIcon.horizontalCenter
//                         animatee.to = icons.height / 5 + 70
//                         animatee.running = true
//                     }

//                     //pages Visability
//                     debugPageVisiable = false
//                     gpsPageVisiable = false
//                     massegesPageVisable = false
//                     // callPage.anchors.right = root.right
//                 }
//             }
//         }

//         Image {

//             id: gpsIcon
//             source: "qrc:/Images/location.png"
//             width: callIcon.width
//             height: callIcon.height
//             // x: 20
//             anchors.horizontalCenter: icons.horizontalCenter
//             y: icons.height / 5 + 160

//             MouseArea {
//                 anchors.fill: parent
//                 onClicked: {

//                     // gpsIconSelected = true
//                     gpsPageVisiable = true
//                     if (gpsPageVisiable) {
//                         recanimate.anchors.horizontalCenter = gpsIcon.horizontalCenter
//                         animatee.to = icons.height / 5 + 150
//                         animatee.running = true
//                     }

//                     //pages visability
//                     callingPageVisiable = false
//                     debugPageVisiable = false
//                     massegesPageVisable = false
//                     gPSPage.anchors.verticalCenter = root.verticalCenter
//                 }
//             }
//         }

//         Image {

//             id: massegesIcon
//             source: "qrc:/Images/email.png"
//             width: callIcon.width
//             height: callIcon.height
//             anchors.horizontalCenter: icons.horizontalCenter
//             y: icons.height / 5 + 240
//             MouseArea {
//                 anchors.fill: parent
//                 onClicked: {
//                     massegesPageVisable = true
//                     if (massegesPageVisable) {
//                         recanimate.anchors.horizontalCenter = massegesIcon.horizontalCenter
//                         animatee.to = icons.height / 5 + 230
//                         animatee.running = true
//                     }

//                     //pages visability
//                     gpsPageVisiable = false
//                     callingPageVisiable = false
//                     debugPageVisiable = false
//                 }
//             }
//         }
//     }

//     // ##################### {Main Page} ###########################################
//     Item {
//         id: logo
//         width: root.width
//         height: root.height - 100

//         Image {
//             id: carIcon
//             // source: "qrc:/Images/sport-car.png"
//             scale: 0.6
//             anchors.centerIn: logo
//         }

//         Text {
//             id: mainHeader
//             y: logo.height - 150
//             text: qsTr("Driver Monitoring System")

//             color: "white"
//             font {
//                 pixelSize: 32
//                 family: idFont.name
//                 // bold: true
//             }
//             Text {
//                 id: dms
//                 text: qsTr("DMS")
//                 anchors {
//                     // centerIn: parent
//                     horizontalCenter: mainHeader.horizontalCenter
//                     top: mainHeader.bottom
//                 }
//                 color: mainHeader.color
//                 font {
//                     pixelSize: mainHeader.font.pixelSize
//                     family: idFont.name
//                 }
//             }

//             anchors {

//                 // bottom: (carIcon.bottom)
//                 horizontalCenter: carIcon.horizontalCenter
//             }
//         }
//         FontLoader {
//             id: idFont
//             source: "qrc:/Fonts/Bungee-Inline.otf"
//         }
//     }
// }

