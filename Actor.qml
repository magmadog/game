import QtQuick 2.0

Item {
    id: actor
    property int xVelocity: 0
    property int yVelocity: 0

    property int xw: x
    property int yw: y
    width: 118
    height: 118
    SpriteSequence {
        id: r
        width: 60
        height: 120
        interpolate: false
        Sprite {
            name: "idleright"
            source: "sprites/idleright.png"
            frameWidth: 81
            frameHeight: 141
            frameCount: 7
            frameX: 0
            frameY: 0
            frameDuration: 120
            reverse: true
            to: {"idle":1}
        }

        Sprite  {
            name: "right"
            source: "sprites/runright.png"
            frameCount: 26
            frameWidth: 120
            frameHeight: 136
            frameX: 0
            frameY: 0
            frameDuration: 40
            to: {"right":1}
        }



        Sprite {
            name: "idleleft"
            source: "sprites/idleleft.png"
            frameCount: 7
            frameWidth: 81
            frameHeight: 141
            frameX: 0
            frameY: 0
            frameDuration: 120
        }

        Sprite {
            name: "jumpright"
            source: "sprites/jumpright.png"
            frameCount: 15
            frameWidth: 120
            frameHeight: 138
            frameX: 0
            frameY: 0
            frameDuration: 70
            to: {"idleright":1}
        }
        Sprite {
            name: "left"
            source: "sprites/runleft.png"
            frameCount: 26
            frameWidth: 120
            frameHeight: 136
            frameX: 120
            frameY: 0
            frameDuration: 40
        }
        Sprite {
            name: "jumpleft"
            source: "sprites/jumpleft.png"
            frameCount: 15
            frameWidth: 120
            frameHeight: 138
            frameX: 0
            frameY: 0
            frameDuration: 70
            to: {"idleleft":1}
        }
    }

    SequentialAnimation {id: an
        alwaysRunToEnd: true
        PropertyAnimation {
            target: actor
            properties: yVelocity
            from: 6*128 - 240
            to: 5*128 - 300
            easing.type: Easing.OutQuad
            easing.period: 1.5
            duration: 500

        }
        PropertyAnimation {
            target: actor
            properties: yVelocity
            from: 5*128 - 300
            to: 6*128 - 240
            easing.type: Easing.OutQuad
            duration: 500
        }
    }
    focus: true

    Keys.onPressed: {
        if (event.isAutoRepeat) {
            return;
        }

        switch (event.key) {
        case Qt.Key_Left:
            xVelocity -= 4
            break;
        case Qt.Key_Right:
            xVelocity += 4
            break;
        case Qt.Key_Up:
            an.start()
            yVelocity -= 4
            break;
        }
    }

    Keys.onReleased: {
        if (event.isAutoRepeat) {
            return;
        }
        switch (event.key) {
        case Qt.Key_Left:
            xVelocity += 4
            if (xVelocity == 0 && yVelocity == 0) r.jumpTo("idleleft");
            break;
        case Qt.Key_Right:
            xVelocity -= 4
            if (xVelocity == 0 && yVelocity == 0) r.jumpTo("idleright");
            break;
        case Qt.Key_Up:
            yVelocity += 4
            break;
        case Qt.Key_Escape:
            gameStopped()
            break;
        }
    }

        Timer {
            interval: 5
            triggeredOnStart: true
            running: true
            repeat: true
            onTriggered: {
                actor.xw += xVelocity
                actor.yw += yVelocity
                if (xVelocity < 0 && yVelocity == 0) r.jumpTo("left");
                else if(xVelocity < 0 && yVelocity < 0) r.jumpTo("jumpleft");
                else if(xVelocity > 0 & yVelocity < 0) r.jumpTo("jumpright");
                else if (xVelocity > 0 && yVelocity == 0) r.jumpTo("right");
                else if (xVelocity == 0 && yVelocity < 0) r.jumpTo("jumpright");

            }
    }
}
