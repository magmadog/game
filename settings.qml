import QtQuick 2.0
import Qt.labs.settings 1.0

Rectangle {
    width: 800
    height: 600

    signal gameSettings

    Button {
        anchors.centerIn: parent
        text: "Выйти в менюшку"
        onClicked: parent.gameStopped()
    }
}
