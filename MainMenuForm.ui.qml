import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Item {
    id: mainMenu
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top
    property alias calendarButton: calendarButton
    property alias fotoButton: fotoButton
    property alias mapButton: mapButton
    property alias checkButton: checkButton
    property alias changeButton: changeButton
    property alias signOutButton: signOutButton

    Image {
        id: logoImage
        anchors.fill: parent
        source: "qrc:/pictures/paper.jpg"
    }
    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        Button {
            id: calendarButton
            text: qsTr("My adventures")
            height: 70
            anchors.top: columnLayout.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.left: parent.left
            font.capitalization: Font.MixedCase
        }

        Button {
            id: fotoButton
            text: qsTr("My gallery")
            height: 70
            anchors.top: calendarButton.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.left: parent.left
            font.capitalization: Font.MixedCase
        }

        Button {
            id: mapButton
            text: qsTr("My routs")
            height: 70
            anchors.top: fotoButton.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.left: parent.left
            font.capitalization: Font.MixedCase
        }

        Button {
            id: checkButton
            text: qsTr("My check")
            height: 70
            anchors.top: mapButton.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.left: parent.left

            font.capitalization: Font.MixedCase
        }

        Button {
            id: changeButton
            text: qsTr("Settings")
            height: 70
            anchors.top: checkButton.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.left: parent.left
            font.capitalization: Font.MixedCase
        }

        Button {
            id: signOutButton
            text: qsTr("Sign out")
            height: 70
            anchors.top: changeButton.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.left: parent.left
            font.capitalization: Font.MixedCase
        }
    }
}
