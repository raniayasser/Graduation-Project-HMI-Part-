import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15

// import CustomComponents 1.0
Window {

    visible: true
    width: 800
    height: 480
    title: qsTr("main page")

    property bool callingPageVisiable: false
    property bool debugPageVisiable: false
    property bool gpsPageVisiable: false
    property bool massegesPageVisable: false
    property int currentIndex: 0
    // Fonts
    FontLoader {
        id: fontbold
        source: "qrc:/Fonts/inria-serif/InriaSerif-Bold.otf"
    }
    FontLoader {
        id: font2
        source: "qrc:/Fonts/inria-serif/InriaSerif-Regular.otf"
    }
    FontLoader {
        id: iclandFont
        source: "qrc:/Fonts/Iceland-Regular.ttf"
    }
    Rectangle {
        id: root
        width: 800
        height: 480

        Image {
            id: logoPhoto
            source: "qrc:/Images/carlogo2.jpg"
            anchors.fill: parent
        }

        // ##################### {left Navbar} ###########################################
        Rectangle {
            id: icons
            height: root.height
            width: 70
            color: "transparent"
            anchors {

                verticalCenter: root.verticalCenter
            }

            Rectangle {
                height: root.height
                width: 110
                x: -40
                color: "#191C28"
                opacity: 0.2
                radius: 100
                border.color: "white"
                border.width: 2
            }
            // radius: 100
            Rectangle {
                id: recanimate
                width: icons.width - 2
                height: 50
                color: gpsPageVisiable || callingPageVisiable
                       || debugPageVisiable
                       || massegesPageVisable ? "#191C28" : "transparent"

                // opacity: 0.5
                // z: -1
                NumberAnimation on y {

                    id: animatee
                    duration: 300
                    easing.type: Easing.InOutQuad
                    running: false
                }
            }

            Image {
                id: debugIcon
                source: "qrc:/Images/application.png"
                width: 30
                height: 30
                y: icons.height / 5
                anchors.horizontalCenter: icons.horizontalCenter

                MouseArea {
                    anchors.fill: parent
                    onClicked: {

                        debugPageVisiable = true
                        if (debugPageVisiable) {
                            animatee.to = icons.height / 5 - 10
                            animatee.running = true
                            recanimate.anchors.horizontalCenter = debugIcon.horizontalCenter
                        }
                        //pages visability
                        callingPageVisiable = false
                        gpsPageVisiable = false
                        massegesPageVisable = false
                        // debugMoodPage.anchors.right = root.right
                    }
                }
            }

            Image {

                id: callIcon
                source: "qrc:/Images/phone-call (2).png"
                width: 30
                height: 30
                y: icons.height / 5 + 80
                anchors.horizontalCenter: icons.horizontalCenter

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // callIconSelected = true
                        callingPageVisiable = true
                        if (callingPageVisiable) {
                            recanimate.anchors.horizontalCenter = callIcon.horizontalCenter
                            animatee.to = icons.height / 5 + 70
                            animatee.running = true
                            // myCalling.makePhoneCall("+20102077200")
                        }

                        //pages Visability
                        debugPageVisiable = false
                        gpsPageVisiable = false
                        massegesPageVisable = false
                        // callPage.anchors.right = root.right
                    }
                }
            }

            Image {

                id: gpsIcon
                source: "qrc:/Images/location.png"
                width: callIcon.width
                height: callIcon.height
                // x: 20
                anchors.horizontalCenter: icons.horizontalCenter
                y: icons.height / 5 + 160

                MouseArea {
                    anchors.fill: parent
                    onClicked: {

                        gpsPageVisiable = true
                        if (gpsPageVisiable) {
                            recanimate.anchors.horizontalCenter = gpsIcon.horizontalCenter
                            animatee.to = icons.height / 5 + 150
                            animatee.running = true
                        }

                        //pages visability
                        callingPageVisiable = false
                        debugPageVisiable = false
                        massegesPageVisable = false
                        gPSPage.anchors.verticalCenter = root.verticalCenter
                    }
                }
            }

            Image {

                id: massegesIcon
                source: "qrc:/Images/Union.png" //"qrc:/Images/email.png"
                width: callIcon.width
                height: callIcon.height
                anchors.horizontalCenter: icons.horizontalCenter
                y: icons.height / 5 + 240
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        massegesPageVisable = true
                        if (massegesPageVisable) {
                            recanimate.anchors.horizontalCenter = massegesIcon.horizontalCenter
                            animatee.to = icons.height / 5 + 230
                            animatee.running = true
                        }

                        //pages visability
                        gpsPageVisiable = false
                        callingPageVisiable = false
                        debugPageVisiable = false
                    }
                }
            }
        }

        // ##################### {Denamic Clock And Data } ###########################################
        Rectangle {
            id: clock
            x: root.width / 4
            y: 50
            property alias timeText: clockNum.text

            Text {
                id: clockNum
                color: "white"
                font {
                    pixelSize: 80
                    family: iclandFont.name
                }
            }

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    var now = new Date()
                    var hours = now.getHours()
                    var minutes = now.getMinutes()
                    var seconds = now.getSeconds()
                    // Format hours, minutes, and seconds to have leading zeros if less than 10
                    var formattedTime = (hours < 10 ? "0" : "") + hours + " : "
                            + (minutes < 10 ? "0" : "") + minutes
                    clockNum.text = formattedTime
                }
            }
            Text {
                id: dataTxt
                color: "#ABABAB"
                text: {
                    var now = new Date()
                    var monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
                    var day = now.getDate()
                    var monthIndex = now.getMonth()
                    var year = now.getFullYear()
                    return day + " " + monthNames[monthIndex] + " " + year
                }
                anchors.top: clockNum.bottom
                font {
                    pixelSize: 26
                    family: iclandFont.name
                }
            }
        }
    }

    // ##################### {Debug Mode Page} ###########################################
    Loader {
        id: debugMoodPage
        source: "qrc:/debugPage.qml"
        anchors {
            verticalCenter: root.verticalCenter
        }

        visible: debugPageVisiable
    }

    // ##################### {Calling Page} ###########################################
    Loader {
        id: callPage
        source: "qrc:/callingPage.qml"
        visible: callingPageVisiable
        anchors.right: root.right
    }

    // ##################### {gps Level} ###########################################
    Loader {
        id: gPSPage
        source: "qrc:/gpsPage.qml"
        // anchors.left: icons.right
        anchors {
            verticalCenter: root.verticalCenter
        }
        visible: gpsPageVisiable
    }

    // ##################### {Masseges Page} ###########################################
    Loader {
        id: massegePage
        source: "qrc:/massagesPage.qml"
        anchors.right: root.right
        anchors {
            verticalCenter: root.verticalCenter
        }
        visible: massegesPageVisable
    }

    // ##################### {Low Risk Level} ###########################################
    // Loader {
    //     id: lowAlertPage
    //     source: "qrc:/LowAlert.qml"
    //     anchors.fill: root
    //     visible: false
    // }

    // // ##################### {High Risk Level} ###########################################
    Loader {
        id: lowAlertPage
        source: "qrc:/LowAlert.qml"
        anchors.fill: parent
        visible: monitor.lowAlertActive // Show when low alert is active
    }

    Loader {
        id: highAlertLoader
        source: "qrc:/HighAlert.qml"
        anchors.fill: parent
        visible: monitor.highAlertActive // Show when high alert is active
    }
}
