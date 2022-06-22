import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Window {
    id: main_window
    width: 320
    height: 480
    visible: true
    title: qsTr("Dating form")

    LinearGradient {
           anchors.fill: parent
           start: Qt.point(0, 0)
           end: Qt.point(0, parent.height)
           gradient: Gradient {
                GradientStop { position: 0.0; color: "white" }
                GradientStop { position: 0.1; color: "#fff0f5" }
                GradientStop { position: 1.0; color: "#f08080" }
           }
       }


    Flickable {
        id: flickable
        anchors.fill: parent
       // width: main_window.width / 3
       // height: main_window.height / 3

        contentWidth: repeater_element.width
        contentHeight: repeater_element.height+my_column.y
        ScrollBar.vertical: scrollBar


        // container
        ColumnLayout {
            id: my_column
            x: 30
            y: 75
            width: 260
            height: 190
            Layout.alignment: Qt.AlignCenter
            // contents
            ColumnLayout {
                id: repeater_element
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: false
                spacing: 5

//                Rectangle {
//                    Layout.fillWidth: false
//                    Layout.fillHeight: false
//                    Layout.preferredWidth: 150
//                    Layout.preferredHeight: 150
//                    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
//                    color: 'white'
//                }

                 RowLayout {

                    Layout.fillWidth: true

                    Label {
                        text:qsTr("Name:")
                    }

                    TextField {
                        Layout.fillWidth: true

                    }

                 }

                 RowLayout {
                     Layout.fillWidth: true
                     Label {
                         text:qsTr("Last name:")
                     }

                     TextField {
                         Layout.fillWidth: true

                     }
                 }

                 RowLayout {
                     width: repeater_element.width
                     Layout.fillWidth: true

                         RadioButton {
                             text: qsTr("Male")
                             checked: true

                         }
                         RadioButton {
                             text: qsTr("Female")
                         }


                     }

                 RowLayout {
                     width: repeater_element.width
                     Layout.fillWidth: true
                     Label {
                         text:qsTr("Age:")
                     }

                     SpinBox {
                         id: spinBox
                             editable: true
                     }
                 }

                 RowLayout {
                     width: repeater_element.width
                     Layout.fillWidth: true
                     Label {
                         text:qsTr("Education:")
                     }

                     ComboBox {
                         Layout.fillWidth: true
                         editable: false
                         model: ListModel {
                             id: model
                             ListElement { text: "Среднее общее" }
                             ListElement { text: "Cреднее профессиональное"}
                             ListElement { text: "Высшее" }
                         }
                     }
                 }

                 RowLayout {
                     width: repeater_element.width
                     Layout.fillWidth: true
                     Label {
                         text:qsTr("Age range:")
                     }

                     Label {
                         id:lfirst
                         text:"25"
                     }

                     RangeSlider {
                         id:slider
                         Layout.fillWidth: true
                         from: 1
                         stepSize: 1
                        to: 99
                            first.value: 25
                                second.value: 75
                                first.onMoved:  lfirst.text = Math.round(first.value)
                                second.onMoved:  lsecond.text =  Math.round(second.value)
                     }
                     Label {
                         id:lsecond
                         text:"75"
                     }
                 }


//                    Rectangle {
//                        Layout.fillWidth: true
//                        Layout.fillHeight: false
//                        Layout.preferredHeight: 75
//                        Layout.alignment: Qt.AlignTop
//                        color: 'black'
//                    }
            }
        }

        Row  {
            id: row
            y: 10
            anchors.horizontalCenter: my_column.horizontalCenter
            Text {
                id: element
                x: 20
                y: 48
                width: 130
                height: 30
                text: qsTr("Dating form")
                anchors.verticalCenter: parent.verticalCenter
                font.family: "Verdana"
                font.pixelSize: 22
                color:"#f08080"
            }
            Image {
                id: image
                x: 180
                y: row.y+10
                width: 50
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/heart.gif"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    ScrollBar {
        id: scrollBar
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

       // try this for fun
       // rotation: 5

        contentItem: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            border.width: 1
            border.color:"grey"
            color: "transparent"
        }
    }
}




/*##^##
Designer {
    D{i:2;anchors_height:200;anchors_width:250}D{i:1;anchors_height:200;anchors_width:100}
}
##^##*/
