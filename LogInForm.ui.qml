import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
    id: logInScene
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.top: parent.top
    anchors.topMargin: 0

    Image {
        id: logo
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
        anchors.top: logo.bottom
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
            x: 251
            y: 134
            text: qsTr("Log in")
            anchors.top: passwordField.bottom
            anchors.topMargin: 10
            anchors.right: columnLayout.right
            anchors.rightMargin: 100
            anchors.left: columnLayout.left
            anchors.leftMargin: 100
        }

        Button {
            id: signUpButton
            x: 270
            y: 181
            text: qsTr("Sign up")
            anchors.top: logInButton.bottom
            anchors.topMargin: 50
            anchors.right: columnLayout.right
            anchors.rightMargin: 25
            anchors.left: columnLayout.left
            anchors.leftMargin: 25

            background: Rectangle {
                            color: "#7CFC00"
                            radius: 4
                            MouseArea {
                                       id: button_green_mouse_area
                                       anchors.fill: parent
                                       hoverEnabled: true
                                       onEntered: parent.color = "#00FF00"
                                       onExited: parent.color = "#7CFC00"
                                       onClicked: parent.color = "#ADFF2F"
                            }
                        }
        }
    }
}
