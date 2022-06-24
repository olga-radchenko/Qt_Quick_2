
import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Window {
    id: main_window
    width: 320
    height: 480
    visible: true
    title:  qsTr("Square transform")

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            id:babyRect
            height:150
            width: 150
            color:"transparent"
            border.color: "black"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            MouseArea {
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                anchors.fill: parent
                hoverEnabled: true
                onClicked:  {
                    if (mouse.button === Qt.RightButton)
                        anmation_3.restart()
                    else
                        anmation_1.restart()
                }

                onDoubleClicked: {
                    if (mouse.button === Qt.RightButton)
                        anmation_4.restart()
                    else
                        anmation_2.restart()
                }
            }
        }

        PropertyAnimation {
            id:anmation_1
            target: babyRect
            property: "color"
            to: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
            duration: 500
        }

        PropertyAnimation {
            id:anmation_2
            target: babyRect
            property: "radius"
            to: 360
            duration: 500
        }

        PropertyAnimation {
            id:anmation_3
            target: babyRect
            property: "rotation"
            from:0
            to: 360
            duration: 500
        }

        PropertyAnimation {
            id:anmation_4
            target: babyRect
            property: "radius"
            to: 0
            duration: 500
        }
    }
}
