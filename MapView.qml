import QtQuick 2.0
import QtQuick.Controls 2.1
import QtLocation 5.6
import QtPositioning 5.6
import QtQuick.Controls.Styles 1.4

Item {
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top

    Plugin {
        id: mapPlugin
        name: "osm"
    }
    PluginParameter {
                  name: "osm.mapping.host";
                  value: "http://a.tile.openstreetmap.org/"
              }

    Map {
        id: map
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        plugin: mapPlugin
        zoomLevel: 16
        center{
            latitude: positionSource.position.coordinate.latitude
            longitude: positionSource.position.coordinate.longitude
        }

        MapQuickItem {
            id: marker
            coordinate: map.center

            sourceItem: Image {
                id: image
                source: "/pictures/marker.png"
                opacity: markerMouseArea.pressed ? 0.6 : 1.0
            }
            MouseArea {
                id: markerMouseArea
                property int pressX : -1
                property int pressY : -1
                property int jitterThreshold : 10
                property int lastX: -1
                property int lastY: -1
                anchors.fill: parent
                hoverEnabled : false
                drag.target: marker
                preventStealing: true

                onPressed : {
                    map.pressX = mouse.x
                    map.pressY = mouse.y
                    map.currentMarker = -1
                    for (var i = 0; i< map.markers.length; i++){
                        if (marker == map.markers[i]){
                            map.currentMarker = i
                            break
                        }
                    }
                }

                onPressAndHold:{
                    if (Math.abs(map.pressX - mouse.x ) < map.jitterThreshold
                            && Math.abs(map.pressY - mouse.y ) < map.jitterThreshold) {
                        var p = map.fromCoordinate(marker.coordinate)
                        lastX = p.x
                        lastY = p.y
                        map.showMarkerMenu(marker.coordinate)
                    }
                }
            }

        }

    }





    PositionSource {
            id: positionSource

            onSourceErrorChanged: {
                if (sourceError == PositionSource.NoError)
                    return

                console.log("Source error: " + sourceError)
                activityText.fadeOut = true
                stop()
            }

            onUpdateTimeout: {
                activityText.fadeOut = true
            }
        }

    Button{
        id: addButton
        text: qsTr("Add new point")
       // f.capitalization: Font.MixedCase
        font.capitalization: Font.MixedCase
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: map.bottom
    }
}

