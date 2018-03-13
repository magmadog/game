import QtQuick 2.0

Rectangle {
    width: 300
    height: 60
    color: "blue"

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
        onPressed: parent.color = "red"
        onReleased: parent.color = "blue"
        onClicked: parent.clicked()
    }
}









