import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

GridLayout {
    id: gl
    width: 435
    height: 435
    columns: 4
    rows: 4
    columnSpacing: 8
    rowSpacing: 8

    signal runmenu()
    signal loses()
    signal wins()
    signal update()

    property bool end
    property int result
    property int record
    property bool win
    property bool lose
    property bool running

    function help() {
        helpdialog.open()
    }

    function updateresults() {
        update()
    }

    function newgame() {
        var newgameconfig = control.newGame()
        for (var i = 0; i < newgameconfig.length - 1; i++) {
            bricks.itemAt(i).bricktext = newgameconfig[i]
            if (newgameconfig[i] !== 0) {
                bricks.itemAt(i).textvisible = 1
            }
            else {
                bricks.itemAt(i).textvisible = 0
            }
        }
        result = newgameconfig[16]
        coloring(newgameconfig)
        updateresults()
        win = false
        lose = false
    }

    function left() {
        var gameconfig = []
        for (var i = 0; i < bricks.count; i++)
            gameconfig.push(bricks.itemAt(i).bricktext)
        gameconfig.push(result)
        var newgameconfig = control.left(gameconfig)
        end = false
        for (i = 0; i < newgameconfig.length - 1; i++) {
            bricks.itemAt(i).bricktext = newgameconfig[i]
            if (newgameconfig[i] !== 0) {
                bricks.itemAt(i).textvisible = 1
            }
            else {
                bricks.itemAt(i).textvisible = 0
            }
            if (newgameconfig[i] === 2048) end = true
        }
        coloring(newgameconfig)

        result = newgameconfig[16]
        if (result > record) record = result
        updateresults()

        if (end === true) {
            win = true
            running = true
            timer.start()
        }

        if (control.checkmove(newgameconfig) === false) {
            lose = true
            running = true
            timer.start()
        }
    }

    function right() {
        var gameconfig = []
        for (var i = 0; i < bricks.count; i++)
            gameconfig.push(bricks.itemAt(i).bricktext)
        gameconfig.push(result)
        var newgameconfig = control.right(gameconfig)
        end = false
        for (i = 0; i < newgameconfig.length - 1; i++) {
            bricks.itemAt(i).bricktext = newgameconfig[i]
            if (newgameconfig[i] !== 0) {
                bricks.itemAt(i).textvisible = 1
            }
            else {
                bricks.itemAt(i).textvisible = 0
            }
            if (newgameconfig[i] === 2048) end = true
        }
        coloring(newgameconfig)

        result = newgameconfig[16]
        if (result > record) record = result
        updateresults()

        if (end === true) {
            win = true
            running = true
            timer.start()
        }
        if (control.checkmove(newgameconfig) === false) {
            lose = true
            running = true
            timer.start()
        }
    }

    function up() {
        var gameconfig = []
        for (var i = 0; i < bricks.count; i++)
            gameconfig.push(bricks.itemAt(i).bricktext)
        gameconfig.push(result)
        var newgameconfig = control.up(gameconfig)
        end = false
        for (i = 0; i < newgameconfig.length - 1; i++) {
            bricks.itemAt(i).bricktext = newgameconfig[i]
            if (newgameconfig[i] !== 0) {
                bricks.itemAt(i).textvisible = 1
            }
            else {
                bricks.itemAt(i).textvisible = 0
            }
            if (newgameconfig[i] === 2048) end = true
        }
        coloring(newgameconfig)

        result = newgameconfig[16]
        if (result > record) record = result
        updateresults()

        if (end === true) {
            win = true
            running = true
            timer.start()
        }
        if (control.checkmove(newgameconfig) === false) {
            lose = true
            running = true
            timer.start()
        }
    }

    function down() {
        var gameconfig = []
        for (var i = 0; i < bricks.count; i++)
            gameconfig.push(bricks.itemAt(i).bricktext)
        gameconfig.push(result)
        var newgameconfig = control.down(gameconfig)
        end = false
        for (i = 0; i < 16; i++) {
            bricks.itemAt(i).bricktext = newgameconfig[i]
            if (newgameconfig[i] !== 0) {
                bricks.itemAt(i).textvisible = 1
            }
            else {
                bricks.itemAt(i).textvisible = 0
            }
            if (newgameconfig[i] === 2048) end = true
        }
        coloring(newgameconfig)

        result = newgameconfig[16]
        if (result > record) record = result
        updateresults()

        if (end === true) {
            win = true
            running = true
            timer.start()
        }
        if (control.checkmove(newgameconfig) === false) {
            lose = true
            running = true
            timer.start()
        }
    }

    function coloring(gameconfig) {
        for (var i = 0; i < gameconfig.length - 1; i++) {
            if (gameconfig[i] === 0) {
                bricks.itemAt(i).brickcolor = "#CDC1B4"
            }
            if (gameconfig[i] === 2) {
                bricks.itemAt(i).fontcolor = "#776E65"
                bricks.itemAt(i).brickcolor = "#EEE4DA"
            }
            if (gameconfig[i] === 4) {
                bricks.itemAt(i).fontcolor = "#776E65"
                bricks.itemAt(i).brickcolor = "#EDE0C8"
            }
            if (gameconfig[i] === 8) {
                bricks.itemAt(i).fontcolor = "#F9F6F2"
                bricks.itemAt(i).brickcolor = "#F2B179"
            }
            if (gameconfig[i] === 16) {
                bricks.itemAt(i).fontcolor = "#F9F6F2"
                bricks.itemAt(i).brickcolor = "#F2B179"
            }
            if (gameconfig[i] === 32) {
                bricks.itemAt(i).fontcolor = "#F9F6F2"
                bricks.itemAt(i).brickcolor = "#F67C5F"
            }
            if (gameconfig[i] === 64) {
                bricks.itemAt(i).fontcolor = "#F9F6F2"
                bricks.itemAt(i).brickcolor = "#F65E3B"
            }
            if (gameconfig[i] === 128) {
                bricks.itemAt(i).fontcolor = "#F9F6F2"
                bricks.itemAt(i).brickcolor = "#EDCF72"
            }
            if (gameconfig[i] === 256) {
                bricks.itemAt(i).fontcolor = "#F9F6F2"
                bricks.itemAt(i).brickcolor = "#EDCC61"
            }
            if (gameconfig[i] === 512) {
                bricks.itemAt(i).fontcolor = "#F9F6F2"
                bricks.itemAt(i).brickcolor = "#EDC850"
            }
            if (gameconfig[i] === 1024) {
                bricks.itemAt(i).fontcolor = "#F9F6F2"
                bricks.itemAt(i).brickcolor = "#EDC53F"
            }
            if (gameconfig[i] === 2048) {
                bricks.itemAt(i).fontcolor = "#F9F6F2"
                bricks.itemAt(i).brickcolor = "#B4C3CD"
            }
        }
    }

    Timer {
        id: timer
        interval: 1000
        repeat: false
        running: running
        onTriggered: {
            if (win) wins()
            if (lose === true) loses()
            running = false
        }
    }

    Repeater {
        id:bricks
        model: 16

        Brick {

        }
    }

    // Действия после загрузки всех компонентов
    Component.onCompleted: {
        record = control.recordreading()
        updateresults()
        runmenu()
    }

    MessageDialog {
        id: helpdialog
        Text {
            text: "HOW TO PLAY: Use your arrow keys and buttons to move the tiles. When\n two tiles with the same number touch, they merge into one!\n\n" +
                  "КАК ИГРАТЬ: Используйте клавиши со стрелками и кнопки для\n перемещения плитки. Когда две плитки с одинаковым\n номером соприкасаются, они объединяются в одну!"
            font.family: "Helvetica"
            font.pointSize: 14
        }
    }
}
