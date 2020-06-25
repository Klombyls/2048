import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
    id: rl

    property bool rlvisible
    visible: rlvisible

    property int result
    property int record

    signal newgame()
    signal quitapp()
    signal openmenu()
    signal left()
    signal right()
    signal up()
    signal down()

    Item {
        height: 100
        id: tool

        Button {
            x: 240
            y: 30
            width: 150
            height: 40
            text: "Main"
            onClicked: {
                openmenu()
            }
        }

        Rectangle {
            x: 10
            y: 0
            width: 150
            height: 40
            Text {
                x: 5
                y: 11
                text: "Score: " + result
            }
        }
        Rectangle {
            x: 10
            y: 50
            width: 150
            height: 40
            Text {
                id: test
                x: 5
                y: 11
                text: "Record: " + record
            }
        }

        Shortcut {
            context: Qt.ApplicationShortcut
            sequences: ["Esc"]
            onActivated: {
                quitapp()
            }
        }
        Shortcut {
            context: Qt.ApplicationShortcut
            sequences: ["Left"]
            onActivated: {
                left()
            }
        }
        Shortcut {
            context: Qt.ApplicationShortcut
            sequences: ["Right"]
            onActivated: {
                right()
            }
        }
        Shortcut {
            context: Qt.ApplicationShortcut
            sequences: ["Up"]
            onActivated: {
                up()
            }
        }
        Shortcut {
            context: Qt.ApplicationShortcut
            sequences: ["Down"]
            onActivated: {
                down()
            }
        }
    }
}
