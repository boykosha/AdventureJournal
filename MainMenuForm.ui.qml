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
    property alias mapButton: mapButton
    property alias checkButton: checkButton
    property alias signOutButton: signOutButton

    Image {
        id: logoImage
        fillMode: Image.PreserveAspectFit
        anchors.right: parent.right
        anchors.rightMargin: -10
        anchors.left: parent.left
        anchors.leftMargin: -10
        anchors.top: parent.top
        source: "qrc:/pictures/logo_2.png"
    }

    ColumnLayout {
        id: columnLayout
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: logoImage.bottom

        Image {
            id: paperImage
            anchors.fill: parent
            source: "qrc:/pictures/paper.jpg"
        }

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
            id: mapButton
            text: qsTr("My routs")
            height: 70
            anchors.top: calendarButton.bottom
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
            id: signOutButton
            text: qsTr("Sign out")
            height: 70
            anchors.top: checkButton.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.left: parent.left
            font.capitalization: Font.MixedCase
        }
    }
}
