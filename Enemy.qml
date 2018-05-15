import QtQuick 2.0
import QtMultimedia 5.0

Item {
    width: 118
    height: 118

    property int xw: 0
    property int yw: 0

    property bool dead: false

    function setCalm() {
        if(!dead) {
            enemy.jumpTo("calm")
        }
    }

    function setAnxious() {
        if(!dead)
            enemy.jumpTo("anxious")
    }

    function setDead() {
        if(!dead) {
            enemy.jumpTo("dead")
            glass.play()
            dead = true
        }
    }

    SpriteSequence {
        id: enemy
        width: 118
        height: 118
        interpolate: false

        Sprite{
            name: "calm"
            source: "enemy.png"
            frameCount: 1
            frameWidth: 118
            frameHeight: 118
            frameX: 0
            frameY: 354
        }

        Sprite{
            name: "anxious"
            source: "enemy.png"
            frameCount: 1
            frameWidth: 118
            frameHeight: 118
            frameX: 0
            frameY: 236
        }

        Sprite{
            name: "dead"
            source: "enemy.png"
            frameCount: 1
            frameWidth: 118
            frameHeight: 118
            frameX: 118
            frameY: 354
        }
    }

    PropertyAnimation {
        target: enemy
        properties: "x"
        from: -5
        to: 5
        duration: 100
        running: enemy.currentSprite === "anxious"
        loops: Animation.Infinite
    }

    SoundEffect {
        id: glass
        source: "glass.wav"
    }
}
