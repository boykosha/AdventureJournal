import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4

Item {
    id: checkView
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top

    TableView {
        id: tableView
        anchors.fill: parent


        TableViewColumn {
            role: "item"
            title: "Item"
        }
        TableViewColumn {
            role: "price"
            title: "Price"
        }
        TableViewColumn {
            role: "currency"
            title: "Currency"
        }


        model: myModel

        rowDelegate: Rectangle {
            anchors.fill: parent
            color: styleData.selected ? 'skyblue' : (styleData.alternate ? 'whitesmoke' : 'white');
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton | Qt.LeftButton
                onClicked: {
                    tableView.selection.clear()
                    tableView.selection.select(styleData.row)
                    tableView.currentRow = styleData.row
                    tableView.focus = true

                    switch(mouse.button) {
                    case Qt.RightButton:
                        contextMenu.popup()
                        break
                    default:
                        break
                    }
                }
            }
        }
    }


    Menu {
        id: contextMenu

        MenuItem {
            text: qsTr("Удалить")
            onTriggered: {
                dialogDelete.open()
            }
        }
    }


    MessageDialog {
        id: dialogDelete
        title: qsTr("Удаление записи")
        text: qsTr("Подтвердите удаление записи из журнала")
        icon: StandardIcon.Warning
        standardButtons: StandardButton.Ok | StandardButton.Cancel

        onAccepted: {
            database.removeRecord(myModel.getId(tableView.currentRow))
            myModel.updateModel();
        }
    }

}
