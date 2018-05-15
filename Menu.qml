import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: menu
    width: 960
    height: 720

    signal gameStarted

    Image {
        id: back
        source: "sprites/123.jpg"
        width: 960
        height: 720
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 5
        Button {
            text: "Начать игру"
            onClicked: menu.gameStarted()
        }
        Button {
            text: "Настройки"
            onClicked: settings.gameSettings()
        }
        Button {
            text: "Выход"
            onClicked: {
                Qt.quit()
            }
        }
    }
}
