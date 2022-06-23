import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.0

Window {
    id: main_window
    width: 320
    height: 480
    visible: true
    title:  qsTr("Dating form")

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
        contentWidth: repeater_element.width
        contentHeight: repeater_element.height+my_column.y
        ScrollBar.vertical: scrollBar

        ColumnLayout { // container
            id: my_column
            x: 30
            y: 75
            width: 260
            height: 190
            Layout.alignment: Qt.AlignCenter

            ColumnLayout { // contents
                id: repeater_element
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: false
                spacing: 20

//                Row {
//                    id: row1
//                    height: 150
//                    Layout.fillWidth: true
//                    Rectangle {
//                        id: rectangle
//                        width: 150
//                        height: 150
//                        color: "white"
//                        border.color: "#f08080"
//                        radius: 10
//                        anchors.horizontalCenter: parent.horizontalCenter
//                        anchors.verticalCenter: parent.verticalCenter

//                        Image {
//                            id:imagemy
//                            anchors.fill: parent
//                        }

//                        Button {
//                            text: "Load image:"

//                            background: Rectangle {
//                                color: "transparent"
//                                border.color:"#f08080"
//                                radius: 10
//                            }

//                            anchors.verticalCenter: parent.verticalCenter
//                            anchors.horizontalCenter: parent.horizontalCenter
//                            onClicked: {
//                                fileDialog.open()
//                            }
//                        }
//                    }
//                }

                GroupBox {
                    font.pointSize: 8
                    font.family: "MV Boli"
                    title:"About me"
                    Layout.fillWidth: true

                    background: Rectangle {
                        width: parent.width
                        color: "transparent"
                        border.color: "#f08080"
                        radius: 10
                    }

                    ColumnLayout {
                        anchors.fill: parent

                        RowLayout {
                            Layout.fillWidth: true

                            Label { text:qsTr("First name:") }

                            TextField { Layout.fillWidth: true }
                        }

                        RowLayout {
                            Layout.fillWidth: true

                            Label { text:qsTr("Last name:") }

                            TextField { Layout.fillWidth: true }
                        }

                        RowLayout {
                            Layout.fillWidth: true

                            Label {
                                text:qsTr("Sex:")
                                Layout.fillWidth: true
                            }

                            RadioButton {
                                text: qsTr("Male")
                                Layout.fillWidth: true
                                checked: true

                            }

                            RadioButton {
                                text: qsTr("Female")
                                Layout.fillWidth: true
                            }
                        }

                        RowLayout {
                            width: parent.width
                            spacing: 35
                            Layout.fillWidth: true

                            Label {
                                 width: 55
                                 text:qsTr("Age:")
                                 Layout.fillWidth: false
                            }

                            SpinBox {
                                 id: spinBox
                                 from: 18
                                 to:99
                                 x: 60
                                 width: 200
                                 Layout.fillWidth: true
                                 editable: true
                            }
                        }

                        RowLayout {

                            Label {
                                text:qsTr("Education:")
                                width: 55
                            }

                            ComboBox {
                                x: 60
                                editable: false
                                Layout.fillWidth: true
                                model: ListModel {
                                    id: model
                                    ListElement { text: "Среднее общее" }
                                    ListElement { text: "Cреднее профессиональное"}
                                    ListElement { text: "Высшее" }
                                }
                            }
                        }
                    }
                }
                GroupBox {
                    font.family: "Mv Boli"
                    title:"Who i want to date"
                    Layout.fillWidth: true

                    background: Rectangle {
                        width: parent.width
                        color: "transparent"
                        border.color: "#f08080"
                        radius: 10
                    }

                    ColumnLayout {
                        RowLayout {
                            width: parent.width
                            Label {
                                text:qsTr("Age range")
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                            }
                        }

                        RowLayout {
                            width: parent.width

                            Label {
                                id:lfirst
                                text:"25"
                            }

                            RangeSlider {
                                id:slider
                                width: 180
                                from: 18
                                stepSize: 1

                                to: 99
                                first.value: 25
                                second.value: 90
                                first.onMoved:  lfirst.text = Math.round(first.value)
                                second.onMoved:  lsecond.text = Math.round(second.value)
                            }

                            Label {
                                id:lsecond
                                text:"90"
                             }
                        }

                        RowLayout {
                            Layout.fillWidth: true

                            Label {
                                text:qsTr("Sex:")
                                Layout.fillWidth: true
                            }

                            RadioButton {
                                height: 20
                                text: qsTr("Male")
                                font.pointSize: 7
                                Layout.fillWidth: true
                                checked: true
                            }

                            RadioButton {
                                height: 20
                                text: qsTr("Female")
                                font.pointSize: 7
                                Layout.fillWidth: true
                            }

                            RadioButton {
                                height: 20
                                text: qsTr("Any")
                                font.pointSize: 7
                                Layout.fillWidth: true
                            }
                         }

                        RowLayout {
                            Layout.fillWidth: true

                            Label {
                                 text:qsTr("Education")
                                 horizontalAlignment: Text.AlignHCenter
                                 Layout.fillWidth: true
                            }
                        }

                        RowLayout {
                            CheckBox {
                                 id: checkBox
                                 text: qsTr("Общее")
                                 font.pointSize: 7
                                 Layout.fillWidth: true
                            }

                            CheckBox {
                                 id: checkBox1
                                 text: qsTr("Высшее")
                                 font.pointSize: 7
                                 Layout.fillWidth: true
                            }
                        }

                        RowLayout {
                             CheckBox {
                                 id: checkBox2
                                 text: qsTr("Профессиональное")
                                 font.pointSize: 7
                                 Layout.fillWidth: false
                             }

                            CheckBox {
                                id: checkBox3
                                text: qsTr("Любое")
                                font.pointSize: 7
                                Layout.fillWidth: true
                            }
                        }
                    }
                }
                RowLayout { }
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
                font.family: "MV Boli"
                font.pixelSize: 24
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

       // fun
       // rotation: 5

        contentItem: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            border.width: 1
            border.color:"grey"
            color: "transparent"
        }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)

        }
        onRejected: {
            console.log("Canceled")
        }
    }
}

/*##^##
Designer {
    D{i:2;anchors_height:200;anchors_width:250}D{i:1;anchors_height:200;anchors_width:100}
D{i:10;anchors_width:150}
}
##^##*/
