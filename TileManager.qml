import QtQuick 2.0

Item {
    property var component
    property var sprite
    property var tiles: []

    property var levels : [
        [
            {
                "type": "tile02",
                "x": 0,
                "y": 5,
            },
            {
                "type": "tile02",
                "x": 1,
                "y": 5
            },
            {
                "type": "tile02",
                "x": 2,
                "y": 5
            },
            {
                "type": "tile02",
                "x": 3,
                "y": 5
            },
            {
                "type": "tile02",
                "x": 4,
                "y": 5
            },
            {
                "type": "tile02",
                "x": 5,
                "y": 7
            },
            {
                "type": "tile02",
                "x": 6,
                "y": 5
            },
            {
                "type": "tile02",
                "x": 7,
                "y": 5
            },
            {
                "type": "tile02",
                "x": 8,
                "y": 5
            },
            {
                "type": "tile02",
                "x": 9,
                "y": 7
            },
            {
                "type": "tile02",
                "x": 10,
                "y": 5
            },
            {
                "type": "tile02",
                "x": 11,
                "y": 5
            },
            {
                "type": "tile02",
                "x": 12,
                "y": 5
            }
            ,
            {
                "type": "tile02",
                "x": 13,
                "y": 5
            }
            ,
            {
                "type": "tile02",
                "x": 14,
                "y": 5
            },
            {
                "type": "tile-4",
                "x": 16,
                "y": 4
            },
            {
                "type": "tile-5",
                "x": 17,
                "y": 4
            },
            {
                "type": "tile-6",
                "x": 18,
                "y": 4
            },
            {
                "type": "Bone (1)",
                "x": 8,
                "y": 5
            }

        ]
    ]

    function createSpriteObjects() {
        component = Qt.createComponent("Tile.qml");
        if (component.status == Component.Ready)
            finishCreation();
        else
            component.statusChanged.connect(finishCreation);
    }

    function finishCreation() {
        if (component.status == Component.Ready) {
            levels[0].forEach(function(obj){
                var x = obj.x
                var y = obj.y
                var tile = obj.type
                console.log(x, y, tile)

                sprite = component.createObject(s, {"x": x * 128, "xw" : x * 128, "y": y * 128, "yw" : y * 128, "type": tile});
                if (sprite == null) {
                    // Error Handling
                    console.log("Error creating object");
                }
                tiles.push(sprite)
            })
        } else if (component.status == Component.Error) {
            // Error Handling
            console.log("Error loading component:", component.errorString());
        }
    }
}
