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

    Logo{
        id:logo
    }

    StackView{
        id: stack
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: logo.bottom
        anchors.bottom: parent.bottom

    }
    Component {
           id: logInView
           LogIn{
            signUpButtonMouseArea.onClicked: {
             stack.push(signUpView)
            }
            logInButton.onClicked: {
                stack.push(mainMenuView)
                }
           }
       }

       Component {
            id: signUpView
            SignUp{}


       }
       Component{
        id: mainMenuView
        MainMenu{
            calendarButton.onClicked: {
                stack.push(adventureView)
            }
//            fotoButton.onClicked: {
//                stack.push(galleryView)
//            }
            mapButton.onClicked: {
                stack.push(mapView)
            }
            checkButton.onClicked: {
                stack.push(checkView)
            }
            changeButton.onClicked: {
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
//       Component{
//        id: galleryView
//        GalleryView{}
//       }
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

         Component.onCompleted: stack.push(logInView)

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





