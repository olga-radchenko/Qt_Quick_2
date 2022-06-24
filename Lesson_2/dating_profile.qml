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

    function getpersonEducation() {
      var str = '';
      if(checkBox_Basic.checked)
          str += checkBox_Basic.text
      if(checkBox_Vocational.checked)
          str += ' '+checkBox_Vocational.text
      if(checkBox_Higher.checked)
          str += ' '+checkBox_Higher.text
      return str;
    }

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
                    font.pointSize: 9
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
                        spacing: 15
                        anchors.fill: parent

                        RowLayout {
                            ColumnLayout {
                                height: 85
                                spacing: 30
                                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                                Layout.fillHeight: false
                                Layout.fillWidth: false

                                Label { text:qsTr("First name:") ; font.family: "MV Boli" }
                                Label { text:qsTr("Last name:")  ; font.family: "MV Boli"; Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter }

                            }

                            ColumnLayout {
                                Layout.fillWidth: true

                                TextField {
                                    id:usr_name;
                                    Layout.fillWidth: true
                                    background: Rectangle {
                                        border.color: "#f08080"
                                        radius: 10
                                    }
                                }
                                TextField {
                                    id:usr_sname;
                                    Layout.fillWidth: true
                                    background: Rectangle {
                                        border.color: "#f08080"
                                        radius: 10
                                    }
                                }
                            }
                        }
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 0
                            Layout.alignment: Qt.AlignVCenter
                            Label {
                                text:qsTr("Sex:")
                                font.family: "MV Boli"
                                Layout.fillWidth: true
                            }

                            RadioButton {
                                id:usrRBtn_male
                                text: qsTr("Male")
                                font.family: "MV Boli"
                                Layout.fillWidth: true
                                checked: true
                            }

                            RadioButton {
                                id:usrRBtn_female
                                text: qsTr("Female")
                                font.family: "MV Boli"
                                Layout.fillWidth: true
                            }
                        }

                        RowLayout {
                            ColumnLayout {
                                height: 33
                                spacing: 30
                                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                                Label { text:qsTr("Age:") ;font.family: "MV Boli"   }
                                Label { text:qsTr("Education:") ;font.family: "MV Boli" }
                            }

                            ColumnLayout {
                                height: parent.height

                                SpinBox {
                                    id: age_spinBox
                                    from: 18
                                    to:99
                                    x: 60
                                    width: 200
                                    Layout.fillWidth: true
                                    editable: true
                                    up.indicator: Rectangle {
                                            x: age_spinBox.mirrored ? 0 : parent.width - width
                                            height: parent.height
                                            implicitWidth: 40
                                            implicitHeight: 40
                                            color: age_spinBox.up.pressed ? "#e4e4e4" : "#f6f6f6"
                                            border.color: enabled ? "#f08080" : "#bdbebf"
                                            radius: 10
                                            Text {
                                                text: "+"
                                                font.pixelSize: age_spinBox.font.pixelSize * 2
                                                color: "#f08080"
                                                anchors.fill: parent
                                                fontSizeMode: Text.Fit
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                            }
                                        }

                                        down.indicator: Rectangle {
                                            x: age_spinBox.mirrored ? parent.width - width : 0
                                            height: parent.height
                                            implicitWidth: 40
                                            implicitHeight: 40
                                            color: age_spinBox.down.pressed ? "#e4e4e4" : "#f6f6f6"
                                            border.color: enabled ? "#f08080" : "#bdbebf"
                                            radius: 10
                                            Text {
                                                text: "-"
                                                font.pixelSize: age_spinBox.font.pixelSize * 2
                                                color: "#f08080"
                                                anchors.fill: parent
                                                fontSizeMode: Text.Fit
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                            }
                                        }

                                        background: Rectangle {
                                            implicitWidth: 140
                                            border.color: "#f08080"
                                            radius: 10
                                        }
                                }
                                ComboBox {
                                    id:education_CmbBox
                                    x: 60
                                    editable: false
                                    Layout.fillWidth: true

                                    background: Rectangle {
                                        border.color: "#f08080"
                                        radius: 10
                                    }

                                    model: ListModel {
                                        id: model
                                        ListElement { text: "Basic" }
                                        ListElement { text: "Vocational"}
                                        ListElement { text: "Higher" }
                                    }
                                }
                            }
                        }
                    }
                }
                GroupBox {
                    font.pointSize: 9
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
                        spacing: 15
                        RowLayout {
                            width: parent.width
                            Label {
                                text:qsTr("Age range")
                                font.family: "MV Boli"
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                            }
                        }

                        RowLayout {
                            width: parent.width

                            Label {
                                id:lfirst
                                text:"25"
                                font.pointSize: 7
                                font.family: "MV Boli"
                            }

                            RangeSlider {
                                id:age_slider
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
                                font.pointSize: 7
                                font.family: "MV Boli"
                            }
                        }

                        RowLayout {
                            Layout.fillWidth: true

                            Label {
                                text:qsTr("Sex:")
                                font.family: "MV Boli"
                                Layout.fillWidth: true
                            }

                            RadioButton {
                                id:rBtn_male
                                height: 20
                                text: qsTr("Male")
                                font.family: "MV Boli"
                                font.pointSize: 7
                                Layout.fillWidth: true
                                checked: true
                            }

                            RadioButton {
                                id:rBtn_female
                                height: 20
                                text: qsTr("Female")
                                font.family: "MV Boli"
                                font.pointSize: 7
                                Layout.fillWidth: true
                            }

                            RadioButton {
                                id:rBtn_any
                                height: 20
                                text: qsTr("Any")
                                font.family: "MV Boli"
                                font.pointSize: 7
                                Layout.fillWidth: true
                            }
                         }

                        RowLayout {
                            Layout.fillWidth: true

                            Label {
                                text:qsTr("Education")
                                 font.family: "MV Boli"
                                 horizontalAlignment: Text.AlignHCenter
                                 Layout.fillWidth: true
                            }
                        }

                        RowLayout {
                            spacing: 30
                            ColumnLayout{

                                CheckBox {
                                     id: checkBox_Basic
                                     text: qsTr("Basic")
                                     font.family: "MV Boli"
                                     font.pointSize: 8
                                     Layout.fillWidth: true
                                }

                                CheckBox {
                                     id: checkBox_Vocational
                                     text: qsTr("Vocational")
                                     font.family: "MV Boli"
                                     font.pointSize: 8
                                     Layout.fillWidth: true
                                }
                            }

                            ColumnLayout{
                                 CheckBox {
                                     id: checkBox_Higher
                                     text: qsTr("Higher")
                                     font.family: "MV Boli"
                                     font.pointSize: 8
                                     Layout.fillWidth: false
                                 }

                                CheckBox {
                                    id: checkBox_Any
                                    text: qsTr("Any")
                                    font.family: "MV Boli"
                                    font.pointSize: 8
                                    Layout.fillWidth: true

                                    onCheckStateChanged: {
                                        if(checkState === Qt.Checked) {
                                            checkBox_Basic.checked = true
                                            checkBox_Basic.enabled = false

                                            checkBox_Higher.checked = true
                                            checkBox_Higher.enabled = false

                                            checkBox_Vocational.checked = true
                                            checkBox_Vocational.enabled = false
                                        }
                                        else if(checkState === Qt.Unchecked) {
                                            checkBox_Basic.enabled = true
                                            checkBox_Higher.enabled = true
                                            checkBox_Vocational.enabled = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                RoundButton {
                    id: roundButton
                    text: "Go"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    background: Rectangle {
                            id: btnBackground
                            border.color:"#f08080"
                            color: "#fff0f5"
                            implicitHeight: 50
                            implicitWidth: 50
                            radius: 360
                            opacity: 0.7
                        }
                    onPressed: {
                        btnBackground.opacity = 1
                    }
                    onReleased: {
                        btnBackground.opacity = 0.7
                    }
                    onClicked: {
                        console.log(`User name: ${usr_name.text}`)
                        console.log(`User last name: ${usr_sname.text}`)
                        console.log(`User age: ${age_spinBox.value}`)
                        usrRBtn_male.checked? console.log(`User sex: male`) : console.log(`User sex: female`)
                        console.log(`User education: ${education_CmbBox.currentText}`)

                        console.log(`Сharacteristics of the person the user is looking for:`)
                        console.log(`Person age: from ${Math.round(age_slider.first.value)} to ${Math.round(age_slider.second.value)}`)
                        if(rBtn_any.checked)
                            console.log(`Person sex: any`)
                        else
                            rBtn_male.checked? console.log(`Person sex: male`) : console.log(`User sex: female`)

                        if(checkBox_Any.checked)
                            console.log(`Person education: any`)
                        else
                            console.log(`Person education:`, getpersonEducation())
                    }
                }

                RowLayout {/*space*/}
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
            border.color:"#f08080"
            color: "#fff0f5"
            opacity: 0.7
        }
    }

//    FileDialog {
//        id: fileDialog
//        title: "Please choose a file"
//        folder: shortcuts.home
//        onAccepted: {
//            console.log("You chose: " + fileDialog.fileUrls)

//        }
//        onRejected: {
//            console.log("Canceled")
//        }
//    }
}

/*##^##
Designer {
    D{i:2;anchors_height:200;anchors_width:250}D{i:1;anchors_height:200;anchors_width:100}
D{i:10;anchors_width:150}
}
##^##*/
