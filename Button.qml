import QtQuick 2.0

Rectangle {
    width: 300
    height: 60
    color: "#00000000"

    radius: 10

    property alias text: text.text
    signal clicked

    Text {
        id: text
        text: "Button"
        anchors.centerIn: parent
        font.pointSize: 30
        color: "white"
    }

    MouseArea {
        anchors.fill: parent
        onPressed: parent.color = "#00000000"
        onReleased: parent.color = "#00000000"
        onClicked: parent.clicked()
        onPositionChanged: Positioner <= 100 ? text.color = "red":text.color = "white"
        hoverEnabled: true

    }
}









