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
                //if(!database.match(usernameField.text, passwordField.text)){
                stack.push(mainMenuView)//}
               // else{console.log("DURA")}
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
            fotoButton.onClicked: {
            }
            mapButton.onClicked: {
            }
            checkButton.onClicked: {
            }
            changeButton.onClicked: {
            }
            signOutButton.onClicked: {
                applicationWindow.close();
            }
        }
       }
//       Component{
//        id: adventureView
//       }
//       Component{
//        id: galleryView
//       }
//       Component{
//        id: mapView
//       }
//       Component{
//        id: checkView
//       }
//       Component{
//        id: checkView
//       }
//       Component{
//        id: changeView
//       }

         Component.onCompleted: stack.push(logInView)

         Rectangle {
            focus: true // important - otherwise we'll get no key events

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





