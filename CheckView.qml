import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2


Item {
    id: checkView
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top
    property alias addButton: addButton

    ColumnLayout {
        id: columnLayout
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10

        TextField {
            id: itemField
            placeholderText: qsTr("Item")
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
            id: priceField
            placeholderText: qsTr("Price")
            height: 60
            font.pointSize: 14
            anchors.top: itemField.bottom
            anchors.topMargin: 10
            anchors.right: columnLayout.right
            anchors.rightMargin: 25
            anchors.left: columnLayout.left
            anchors.leftMargin: 25
        }
        TextField {
            id: currencyField
            placeholderText: qsTr("Currency")
            height: 60
            font.pointSize: 14
            anchors.top: priceField.bottom
            anchors.topMargin: 10
            anchors.right: columnLayout.right
            anchors.rightMargin: 25
            anchors.left: columnLayout.left
            anchors.leftMargin: 25
        }

        Button {
            id: addButton
            text: qsTr("Add")
            anchors.top: currencyField.bottom
            anchors.topMargin: 10
            anchors.right: columnLayout.right
            anchors.rightMargin: 100
            anchors.left: columnLayout.left
            anchors.leftMargin: 100
            height: 60

            onClicked: {
                database.insertIntoTable(itemField.text, priceField.text, currencyField.text);
                myModel.updateModel();

            }
        }
    }

}
