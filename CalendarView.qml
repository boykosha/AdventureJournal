import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2

Item{
    id: calendarView
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top

    Calendar {
        id: calendar
        anchors.fill: parent
        frameVisible: true
        weekNumbersVisible: true
        selectedDate: new Date()
        focus: true

        style: CalendarStyle {
            dayDelegate: Item {
                readonly property color sameMonthDateTextColor: "#444"
                readonly property color selectedDateTextColor: "white"
                readonly property color selectedDateColor: "#87CEEB"
                readonly property color differentMonthDateTextColor: "#bbb"
                readonly property color invalidDatecolor: "#dddddd"

                Rectangle {
                    anchors.fill: parent
                    border.color: "transparent"
                    color: styleData.date !== undefined && styleData.selected ? selectedDateColor : "transparent"
                    anchors.margins: styleData.selected ? -1 : 0
                    focus: true
                    MouseArea{
                        id: rectangleMouseArea
                        anchors.fill: parent
                        onClicked: eventDialog.open();

                    }
                }

                Label {
                    id: dayDelegateText
                    text: styleData.date.getDate()
                    anchors.centerIn: parent
                    color: {
                        var color = invalidDatecolor;
                        if (styleData.valid) {
                            color = styleData.visibleMonth ? sameMonthDateTextColor : differentMonthDateTextColor;
                            if (styleData.selected) {
                                color = selectedDateTextColor;
                            }
                        }
                        color;
                    }
                }


            }
        }
    }

    Dialog{
        id: eventDialog
        contentItem: Rectangle{
            width: 600
            height: 500
            color: "#f7f7f7"

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: dividerHorizontal.top
                color: "#f7f7f7"  // Задаём цвет области

                Label {
                    id: textLabel
                    text: qsTr("Do you want add new event?")
                    color: "#34aadc"
                    anchors.centerIn: parent
                            }
                        }

                        Rectangle {
                            id: dividerHorizontal
                            color: "#87CEEB"
                            height: 2
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: row.top
                        }

                        Row {
                            id: row
                            height: 100
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right

                            Button {
                                id: dialogButtonCancel
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                width: parent.width / 2 - 1
                                text: qsTr("Cancel")
                                onClicked: eventDialog.close()
                                }



                            Rectangle {
                                id: dividerVertical
                                width: 2
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                color: "#d7d7d7"
                            }

                            Button {
                                id: dialogButtonOk
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                width: parent.width / 2 - 1
                                text: qsTr("Ok")
                                onClicked: eventDialog.close()
                            }


                        }
        }
    }
}

