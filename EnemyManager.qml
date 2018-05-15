//import QtQuick 2.0

//QtObject {
//    // Ссылка на объект сцены для динамического создания объектов
//    property var gameBoard: null

//    // Геометрия управляемого объекта
//    property int actorWidth: 0
//    property int actorHeight: 0

//    // Геометрия неигрового объекта
//    property int enemyWidth: 0
//    property int enemyHeight: 0

//    // Количество генерируемых неигровых объектов
//    property int enemyNumber: 10

//    // Список (массив) неигровых объектов
//    property var enemies: []

//    // Расстояния между объектами для отслеживания коллизий,
//    // заданные относительно размера управляемого объекта
//    property real trampleDistance: 0.6
//    property real angerDistance: 1.2

//    /*!
//     * Создает заданное количество неигровых элементов,
//     * случайным образом размещая их на сцене
//     */
//    function generateEnemies() {
//        // Создаем компонент на основе QML-описания
//        var component = Qt.createComponent("Enemy.qml")

//        // Отдельно генерируем каждый объект
//        for (var i = 0; i < enemyNumber; i++) {
//            // Выбираем новые случайные координаты до тех пор,
//            // пока объект изначально попадает в коллизию с управляемый персонажем
//            // (который, напомним, находится в центре сцены)
//            do {
//                // Генерируем случайные координаты
//                var x = Math.floor(Math.random() * (gameBoard.width - enemyWidth))
//                var y = Math.floor(Math.random() * (gameBoard.height - enemyHeight))
//                // Вычисляет расстояние до центра сцены
//                var dx = Math.abs(x + enemyWidth / 2 - gameBoard.width / 2)
//                var dy = Math.abs(y + enemyHeight / 2 - gameBoard.height / 2)
//            } while (dx < actorWidth && dy < actorHeight)

//            // Создаем экземпляр компонента
//            var sprite = component.createObject(gameBoard, {"x": x, "xw": x, "y": y, "yw" : y, "z": 0});
//            // Добавляем созданный объект в список
//            enemies.push(sprite)
//        }
//    }

//    /*!
//     * Отслеживает коллизии и модифицирует состояния
//     * неигровых объектов соответственно
//     * На вход функция получает координаты игрового персонажа
//     */
//    function processCollisions(x, y) {
//        // Для каждого элемента списка выполняем функцию проверки
//        enemies.forEach(function(enemy){
//            // Вычисляем расстояние между центрами игрового персонажа и объекта
//            var dx = Math.abs((x + actorWidth / 2) - (enemy.x + enemyWidth / 2))
//            var dy = Math.abs((y + actorHeight / 2) - (enemy.y + enemyHeight / 2))
//            var d = Math.sqrt(dx * dx + dy * dy)
//            // Изменяем состояние объекта в соответствии с условиями коллизии
//            if (d < actorWidth * trampleDistance) enemy.setDead()
//            else if (d < actorWidth * angerDistance) enemy.setAnxious()
//            else enemy.setCalm()
//        })
//    }

//    /*!
//     * Отслеживает коллизии и модифицирует состояния
//     * неигровых объектов соответственно
//     * На вход функция получает координаты игрового персонажа
//     */
//    function move(dx, dy) {
//        // Для каждого элемента списка выполняем функцию проверки
//        enemies.forEach(function(enemy){
//            enemy.x = enemy.xw - dx
//            enemy.y = enemy.yw - dy
//        })
//    }
//}

//import QtQuick 2.0

//Item {
//    property var component
//    property var sprite
//    property var tiles: []

//    property var levels : [
//        [
//            {
//                "type": "tile02",
//                "x": 0,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 1,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 2,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 3,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 4,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 5,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 6,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 7,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 8,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 9,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 10,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 11,
//                "y": 7
//            },
//            {
//                "type": "tile02",
//                "x": 12,
//                "y": 7
//            }
//            ,
//            {
//                "type": "tile02",
//                "x": 13,
//                "y": 7
//            }
//            ,
//            {
//                "type": "tile02",
//                "x": 14,
//                "y": 7
//            }
//        ]
//    ]

//    function createSpriteObjects() {
//        component = Qt.createComponent("Tile.qml");
//        if (component.status == Component.Ready)
//            finishCreation();
//        else
//            component.statusChanged.connect(finishCreation);
//    }

//    function finishCreation() {
//        if (component.status == Component.Ready) {
//            levels[0].forEach(function(obj){
//                var x = obj.x
//                var y = obj.y
//                var tile = obj.type
//                console.log(x, y, tile)

//                sprite = component.createObject(s, {"x": x * 128, "wx" : x * 128, "y": y * 128, "wy" : y * 128, "type": tile});
//                if (sprite == null) {
//                    // Error Handling
//                    console.log("Error creating object");
//                }
//                tiles.push(sprite)
//            })
//        } else if (component.status == Component.Error) {
//            // Error Handling
//            console.log("Error loading component:", component.errorString());
//        }
//    }
//}
