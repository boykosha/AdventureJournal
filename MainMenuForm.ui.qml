import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
    id: mainMenu
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top

    Image {
        id: logoImage
        anchors.fill: parent
        source: "qrc:/pictures/paper.jpg"
    }

    ListView {
        id: listView
        anchors.fill: parent

        model: ListModel {
            ListElement {
                name: "My adventures"
            }

            ListElement {
                name: "My gallery"
            }

            ListElement {
                name: "My routs"
            }

            ListElement {
                name: "My check"
            }
            ListElement {
                name: "Settings"
            }
            ListElement {
                name: "Exit"
            }
        }
        delegate: Item {
            anchors.right: parent.right
            anchors.left: parent.left
            height: 60

            ColumnLayout {
                id: columnLayout
                anchors.fill: parent

                Button {
                    anchors.fill: columnLayout
                    text: name
                    font.capitalization: Font.MixedCase
                }
            }
        }
    }
}
