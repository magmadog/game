import QtQuick 2.2

Rectangle {
    width: 960
    height: 720

    Menu {
        id: menu
        onGameStarted: parent.state = "gameplay"
    }


    Gameplay {
        id: gameplay
        onGameStopped: parent.state = "menu"
    }

    Settings {
        id: settings
        onGameSettings: parent.state = "settings"
    }

    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: menu
                visible: true
            }

            PropertyChanges {
                target: gameplay
                visible: false
            }
            PropertyChanges {
                target: settings
                visible: false
            }
        },
        State {
            name: "gameplay"
            PropertyChanges {
                target: menu
                visible: false
            }
            PropertyChanges {
                target: gameplay
                visible: true
            }
            PropertyChanges {
                target: settings
                visible: false
            }
        },
        State {
            name: "settings"
            PropertyChanges {
                target: menu
                visible: false
            }

            PropertyChanges {
                target: gameplay
                visible: false
            }

            PropertyChanges {
                target: settings
                visible: true
            }
        }

    ]

    state: "menu"
}














