import QtQuick 2.2
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.0

Rectangle {
    anchors.centerIn: parent
    id: settings
    width: 960
    height: 720
    signal gameSettings

    Image {
        id: back
        source: "sprites/123.jpg"
        width: 960
        height: 720
    }
    Button {
        anchors.centerIn: parent
        text: "Звук"
    }

}

