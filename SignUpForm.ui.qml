import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
    id: signUpScene
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top

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

        TextField {
            id: confirmPasswordField
            placeholderText: qsTr("Confirm password")
            height: 60
            font.pointSize: 14
            echoMode: TextInput.Password
            anchors.top: passwordField.bottom
            anchors.topMargin: 10
            anchors.right: columnLayout.right
            anchors.rightMargin: 25
            anchors.left: columnLayout.left
            anchors.leftMargin: 25
        }

        Button {
            id: logInButton
            x: 251
            y: 134
            text: qsTr("Sign up")
            anchors.top: confirmPasswordField.bottom
            anchors.topMargin: 10
            anchors.right: columnLayout.right
            anchors.rightMargin: 100
            anchors.left: columnLayout.left
            anchors.leftMargin: 100
        }
    }
}
