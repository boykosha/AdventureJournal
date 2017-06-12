import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Window 2.2

SignUpForm {
    logInButton.onClicked: {
        if((passwordField.text == confirmPasswordField.text) && (usernameField.text !== "") && (passwordField.text !== "") ){
            database.inserIntoTable(usernameField.text , passwordField.text);
            database.cl}
        else if(passwordField.text != confirmPasswordField.text){
            confirmError.visible = true;
        }
        else{
            confirmError.text = "All fields required";
            confirmError.visible = true;
        }

    }
}


