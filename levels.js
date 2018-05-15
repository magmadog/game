.pragma library

/**
 * LevelManager class
 */
function LevelManager(config) {

    // Constants
    var DEFAULT_BOARD_SIZE = 7
    var MIN_BOARD_SIZE = 2
    var MAX_BOARD_SIZE = 25

    var DEFAULT_CELL_REBORN_DELAY = 0

    var previousMove = Qt.vector2d(Qt.vector2d(0, 0), Qt.vector2d(0, 0))

    // Public interface



    var levels = [
                [
                    {
                        "type": "tile02",
                        "x": 0,
                        "y": 7
                    },
                    {
                        "type": "tile02",
                        "x": 1,
                        "y": 7
                    },
                    {
                        "type": "tile02",
                        "x": 2,
                        "y": 7
                    },
                    {
                        "type": "tile02",
                        "x": 3,
                        "y": 7
                    },
                    {
                        "type": "tile02",
                        "x": 4,
                        "y": 7
                    },
                    {
                        "type": "tile02",
                        "x": 5,
                        "y": 7
                    },
                    {
                        "type": "tile02",
                        "x": 6,
                        "y": 7
                    },
                    {
                        "type": "tile02",
                        "x": 7,
                        "y": 7
                    },
                    {
                        "type": "tile02",
                        "x": 8,
                        "y": 7
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
                        "y": 5
                    },
                    {
                        "type": "tile-5",
                        "x": 17,
                        "y": 5
                    },
                    {
                        "type": "tile-6",
                        "x": 18,
                        "y": 5
                    }
                ],
                []
            ]

    this.getBoard = function() {
        return board
    }

    this.move = function(origin, diff) {

        var explodes = false

        function moveIsCorrect(origin, diff) {
            return true
        }

        function updateBoard(origin, diff) {
            diff.x = diff.x < 0 ? boardSize + diff.x % boardSize : diff.x % boardSize
            diff.y = diff.y < 0 ? boardSize + diff.y % boardSize : diff.y % boardSize
            if (diff.x !== 0) {
                for (var i = 0; i < diff.x; i++) {
                    var temp1 = board[origin.y][boardSize - 1]
                    var temp2 = board[origin.y + 1][boardSize - 1]
                    for (var j = boardSize - 1; j > 0; j--) {
                        board[origin.y][j] = board[origin.y][j - 1]
                        board[origin.y + 1][j] = board[origin.y + 1][j - 1]
                    }
                    board[origin.y][0] = temp1
                    board[origin.y + 1][0] = temp2
                }
            }
            if (diff.y !== 0) {
                for (j = 0; j < diff.y; j++) {
                    temp1 = board[boardSize - 1][origin.x]
                    temp2 = board[boardSize - 1][origin.x + 1]
                    for (i = boardSize - 1; i > 0; i--) {
                        board[i][origin.x] = board[i - 1][origin.x]
                        board[i][origin.x + 1] = board[i - 1][origin.x + 1]
                    }
                    board[0][origin.x] = temp1
                    board[0][origin.x + 1] = temp2
                }
            }
        }

        function explodeRow(i) {
            explodes = true
            console.log("explodeRow")
            for (var j = 0; j < boardSize; j++) {
                board[i][j].alive = false
                board[i][j].delay = cellRebornDelay + 1
            }
        }

        function explodeCol(j) {
            explodes = true
            console.log("explodeCol")
            for (var i = 0; i < boardSize; i++) {
                board[i][j].alive = false
                board[i][j].delay = cellRebornDelay + 1
            }
        }

        function checkLines() {
            var templateColor
            for (var i = 0; i < boardSize; i++) {
                templateColor = board[i][0].color
                for (var j = 1; j < boardSize; j++) {
                    if (board[i][j].color !== templateColor) break
                }
                if (j === boardSize && board[i][0].alive) explodeRow(i)
            }
            for (j = 0; j < boardSize; j++) {
                templateColor = board[0][j].color
                for (i = 1; i < boardSize; i++) {
                    if (board[i][j].color !== templateColor) break
                }
                if (i === boardSize && board[i][0].alive) explodeCol(j)
            }
        }

        function updateCounters() {
            var templateColor
            for (var i = 0; i < boardSize; i++) {
                for (var j = 0; j < boardSize; j++) {
                    if (!board[i][j].alive)
                        board[i][j].delay--
                    if (board[i][j].delay === 0)
                        board[i][j].alive = true
                }
            }
        }

        function checkNew() {
            return true
        }

        if (!moveIsCorrect(origin, diff)) {
            return
        }

        updateBoard(origin, diff)

        checkLines()

        if (explodes || checkNew()) updateCounters()


    }

    this.print = function() {
        console.log("!")
        for (var i = 0; i < boardSize; i++) {
            var s = "(" + board[i][0].color + " " + board[i][0].alive + " " + board[i][0].delay + ")"
            for (var j = 1; j < boardSize; j++) {
                s += " " + "(" + board[i][j].color + " " + board[i][j].alive + " " + board[i][j].delay + ")"
            }
            console.log(s)
        }
    }

    // Private interface

    var boardSize           // Size (width and height) of the game board
    var board               // Current game state
    var cellRebornDelay     // Time to cell restore in moves

    var gameStarted = function(){}
    var gameOver = function(){}
    var moveMade = function(){}
    var cellExploded = function(){}
    var cellReborn = function(){}

    function parseConfig(config) {

        // Check whether the size of the game board is defined and correct
        if (config.boardSize === 'undefined' || typeof config.boardSize !== 'number')
            boardSize = DEFAULT_BOARD_SIZE
        else
            boardSize = config.boardSize

        // Check whether the delay before cell reborn is defined and correct
        if (config.cellRebornDelay === 'undefined' || typeof config.boardSize !== 'number')
            cellRebornDelay = DEFAULT_CELL_REBORN_DELAY
        else
            cellRebornDelay = config.cellRebornDelay
    }

    function generateBoard() {

        // Fill the board with initial values
        function fill() {
            var array = []
            for (var i = 0; i < boardSize; i++) {
                for (var j = 0; j < boardSize; j++) {
                    array[i * boardSize + j] = {
                        color: i + 1,
                        alive: true,
                        delay: 0
                    }
                }
            }

            return array
        }

        // Shuffle the board
        function shuffle(array) {
            // Shuffle the board
            var currentIndex = boardSize * boardSize
            while (0 !== currentIndex) {
                // Pick a random remaining element
                var randomIndex = Math.floor(Math.random() * currentIndex)
                currentIndex--

                // And swap it with the current element.
                var temporaryValue = array[currentIndex]
                array[currentIndex] = array[randomIndex]
                array[randomIndex] = temporaryValue
            }

            return array
        }

        function matrix(array){
            var qq = []
            for (var i = 0; i < boardSize; i++) {
                qq[i] = []
                for (var j = 0; j < boardSize; j++) {
                    qq[i].push(array[i * boardSize + j])
                }
            }
            return qq
        }

        board = matrix(shuffle(fill()))
    }

    // Constructor code
    parseConfig(config)
    generateBoard()
}


