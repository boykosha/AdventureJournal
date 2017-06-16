import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

ApplicationWindow {
    id: applicationWindow
    visible: true
    title: qsTr("Adventure Journal")
    Material.theme: Material.Dark
    Material.accent: Material.Blue


    StackView{
        id: stack
        anchors.fill: parent
    }

       Component{
        id: mainMenuView
        MainMenu{
            calendarButton.onClicked: {
                stack.push(adventureView)
            }
            mapButton.onClicked: {
                stack.push(mapView)
            }
            checkButton.onClicked: {
                stack.push(checkView)
            }
            signOutButton.onClicked: {
                applicationWindow.close();
            }
        }
       }
       Component{
        id: adventureView
        CalendarView{}
       }
       Component{
        id: mapView
        MapView{}
       }
       Component{
        id: checkView
        CheckView{
            addButton.onClicked: {
                 stack.push(tableDataView)
            }
        }
       }
       Component{
        id: tableDataView
        TableData{}
       }

         Component.onCompleted: stack.push(mainMenuView)

         Rectangle {
            focus: true

            Keys.onReleased: {
                if (event.key == Qt.Key_Back) {
                    if(!stack.pop()){
                        applicationWindow.close();
                    }
                    else{
                        stack.pop();
                    }
                    event.accepted = true;
                }
            }
         }
}





