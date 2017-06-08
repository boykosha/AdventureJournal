import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.0
Item {
    id: item1
    //id: item1
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.top: parent.top
    anchors.topMargin: 0

    Image {
        id: image
        fillMode: Image.PreserveAspectFit
        anchors.right: parent.right
        anchors.rightMargin: -10
        anchors.left: parent.left
        anchors.leftMargin: -10
        anchors.top: parent.top
        anchors.topMargin: 0
        source: "qrc:/pictures/logo_2.png"
    }

    ColumnLayout {
        id: columnLayout
        height: 221
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: image.bottom
        anchors.topMargin: 10

        TextField {
            id: textField
            height: 60
            font.underline: false
            placeholderText: qsTr("Username")
            font.pointSize: 14
            anchors.right: columnLayout.right
            anchors.rightMargin: 25
            anchors.left: columnLayout.left
            anchors.leftMargin: 25
            anchors.top: columnLayout.top
            anchors.topMargin: 20
        }

        TextField {
            id: textField1
            height: 60
            font.pointSize: 14
            placeholderText: qsTr("Password")
            anchors.top: textField.bottom
            anchors.topMargin: 10
            anchors.right: columnLayout.right
            anchors.rightMargin: 25
            anchors.left: columnLayout.left
            anchors.leftMargin: 25

        }

        Button {
            id: button
            x: 251
            y: 134
            anchors.top: textField1.bottom
            anchors.topMargin: 10
            anchors.right: columnLayout.right
            anchors.rightMargin: 100
            anchors.left: columnLayout.left
            anchors.leftMargin: 100
            text: qsTr("Log in")
        }

        Button {
            id: button1
            x: 270
            y: 181
            text: qsTr("Sign up")
            anchors.top: button.bottom
            anchors.topMargin: 50
            anchors.right: columnLayout.right
            anchors.rightMargin: 50
            anchors.left: columnLayout.left
            anchors.leftMargin: 50
        }
    }
}
