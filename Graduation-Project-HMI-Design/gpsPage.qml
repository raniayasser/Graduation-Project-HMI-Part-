// import QtQuick 2.15
// import QtLocation 5.12
// import QtPositioning 5.12

// Rectangle {
//     id: mapsPage
//     width: 720
//     height: 480
//     x: 85
//     color: "black"
//     border.color: "gray"
//     radius: 20

//     Rectangle {
//         id: mapLocation
//         width: mapsPage.width //* 4 / 7 + 40
//         border.color: "gray"
//         radius: 20
//         anchors {
//             top: mapsPage.top
//             right: mapsPage.right
//             bottom: mapsPage.bottom
//         }
//         Plugin {
//             id: mapPlugin
//             name: "osm"
//             PluginParameter {
//                 name: "osm.mapping.custom.host"
//                 value: "https://tile.thunderforest.com/dark/%z/%x/%y.png"
//             }
//             PluginParameter {
//                 name: "osm.mapping.custom.query_parameters"
//                 value: {
//                     "apikey": "9f6012e8ea044026a66294441e0d28f7"
//                 }
//             }
//         }

//         Map {
//             id: mapView
//             anchors.fill: parent
//             plugin: mapPlugin
//             center: QtPositioning.coordinate(30.4609, 31.1846)
//             zoomLevel: 14
//         }
//     }
//     // Rectangle {
//     //     id: carLocation
//     //     anchors {
//     //         top: mapsPage.top
//     //         left: mapsPage.left
//     //         bottom: mapsPage.bottom
//     //         right: mapLocation.left
//     //     }
//     //     color: "#191C28"
//     //     // radius:20
//     //     Image {
//     //         id: carRander
//     //         anchors.centerIn: parent
//     //         fillMode: Image.PreserveAspectFit
//     //         width: parent.width

//     //         // source: "qrc:/Images/carRander3.png"
//     //         source: "qrc:/Images/CarStatus.jpg"
//     //     }
//     // }
//     Image {
//         id: closeIcon
//         width: 30
//         height: 30
//         source: "qrc:/Images/close.png"
//         anchors {
//             top: mapsPage.top
//             right: mapsPage.right
//             margins: 10
//         }
//         MouseArea {
//             anchors.fill: parent
//             onClicked: {
//                 gpsPageVisiable = false
//             }
//         }
//     }
// }
import QtQuick 2.15
import QtLocation 5.12
import QtPositioning 5.12

Rectangle {
    id: mapsPage
    width: 720
    height: 480
    x: 85
    color: "black"
    border.color: "gray"
    radius: 20
    Rectangle {
        id: mapLocation
        width: mapsPage.width
        border.color: "gray"
        radius: 20
        anchors {
            top: mapsPage.top
            right: mapsPage.right
            bottom: mapsPage.bottom
        }

        Plugin {
            id: mapPlugin
            name: "osm"
            PluginParameter {
                name: "osm.mapping.custom.host"
                value: "https://tile.thunderforest.com/dark/%z/%x/%y.png"
            }
            PluginParameter {
                name: "osm.mapping.custom.query_parameters"
                value: {
                    "apikey": "9f6012e8ea044026a66294441e0d28f7"
                }
            }
        }

        Map {
            id: mapView
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(0, 0)
            zoomLevel: 14
        }
    }

    PositionSource {
        id: positionSource
        active: true
        updateInterval: 1000 // Update every second
        onPositionChanged: {
            mapView.center = position.coordinate
        }

        Component.onCompleted: {
            positionSource.start()
        }
    }

    Image {
        id: closeIcon
        width: 30
        height: 30
        source: "qrc:/Images/close.png"
        anchors {
            top: mapsPage.top
            right: mapsPage.right
            margins: 10
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gpsPageVisiable = false
            }
        }
    }
}
