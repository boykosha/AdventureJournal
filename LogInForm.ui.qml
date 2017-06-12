import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
    id: logInScene
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top
    property alias signUpButtonMouseArea: signUpButtonMouseArea
    property alias logInButton: logInButton
    property alias columnLayout: columnLayout
    property alias usernameField: usernameField
    property alias passwordField: passwordField


    ColumnLayout {
        id: columnLayout
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10

        TextField {
            id: usernameField
            placeholderText: qsTr("Username")
            height: 60
            font.pointSize: 14
            anchors.right: columnLayout.right
            anchors.rightMargin: 25
            anchors.left: columnLayout.left
            anchors.leftMargin: 25
            anchors.top: columnLayout.top
            anchors.topMargin: 20
        }

        TextField {
            id: passwordField
            placeholderText: qsTr("Password")
            height: 60
            font.pointSize: 14
            echoMode: TextInput.Password
            anchors.top: usernameField.bottom
            anchors.topMargin: 10
            anchors.right: columnLayout.right
            anchors.rightMargin: 25
            anchors.left: columnLayout.left
            anchors.leftMargin: 25
        }

        Button {
            id: logInButton
            text: qsTr("Sign in")
            anchors.top: passwordField.bottom
            anchors.topMargin: 10
            anchors.right: columnLayout.right
            anchors.rightMargin: 100
            anchors.left: columnLayout.left
            anchors.leftMargin: 100
        }

        Button {
            id: signUpButton
            text: qsTr("Sign up")
            anchors.top: logInButton.bottom
            anchors.topMargin: 50
            anchors.right: columnLayout.right
            anchors.rightMargin: 25
            anchors.left: columnLayout.left
            anchors.leftMargin: 25
            background: Rectangle {
                color: "#228B22"
                radius: 4
                MouseArea {
                    id: signUpButtonMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: parent.color = "#32CD32"
                    onEntered: parent.color = "#006400"
                    onExited: parent.color = "#228B22"
                }
            }
        }
    }
}
