import QtQuick 2.0
import Qt.labs.settings 1.0
import QtQuick.Window 2.3

Rectangle {

    width: 960
    height: 720

    signal gameStopped



    Item {
        id: board
        width: 960
        height: 720

        Image {
            id:s
            source: "sprites/backg.png"
            z: -5
            fillMode: Image.Tile
            anchors.fill: parent
        }


//        EnemyManager {
//            id: enemyManager

//            gameBoard: board

//            actorWidth: 118
//            actorHeight: 118

//            enemyWidth: 118
//            enemyHeight: 118

//            enemyNumber: 10

//            Component.onCompleted: generateEnemies()
//        }
        Actor {
            id: actor
            anchors.horizontalCenter: parent.horizontalCenter
            y: 6*128 - 240
            z: -1
            focus: true

            onXwChanged: {t.tiles.forEach(function(obj){
                obj.x = obj.xw - xw
            })}
        }
//            onXwChanged: {
//                enemyManager.move(xw-x,yw-y)
//                enemyManager.processCollisions(x, y)
//            }
//            onYwChanged: {
//                enemyManager.move(xw-x,yw-y)
//                enemyManager.processCollisions(x, y)
//            }

        Component.onCompleted: {

            //showFullScreen()

            t.createSpriteObjects()
        }

        TileManager {
            id: t
        }
    }
}

