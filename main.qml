import QtQuick 2.12
import QtQuick.Window 2.14
import QtQuick.Layouts 1.12

Window {
    id: wind

    visible: true
    minimumWidth: 435
    maximumWidth: 435
    minimumHeight: 535
    maximumHeight: 535
    title: qsTr("2048")
    color: "#bbada0"

    ColumnLayout {
        id: cl

        anchors.centerIn: wind.contentItem

        Gameplay {
            id: gameplay

            onRunmenu: {
                gameplay.visible = false
                toolbar.rlvisible = false
                menupanel.visible = true
                end.visible = false
            }
            onLoses: {
                gameplay.visible = false
                toolbar.rlvisible = false
                end.win = false
                end.lose = true
                end.record = gameplay.record
                end.result = gameplay.result
                control.recordwriting(record)
                menupanel.visible = false
                end.visible = true
            }
            onWins: {
                gameplay.visible = false
                toolbar.rlvisible = false
                end.win = true
                end.lose = false
                end.record = gameplay.record
                end.result = gameplay.result
                control.recordwriting(record)
                menupanel.visible = false
                end.visible = true
            }
            onUpdate: {
                toolbar.record = gameplay.record
                toolbar.result = gameplay.result
            }
        }

        Toolbar {
            id: toolbar

            onQuitapp: Qt.quit()

            onOpenmenu: {
                gameplay.visible = false
                toolbar.rlvisible = false
                menupanel.visible = true
            }
            onLeft: if (toolbar.rlvisible === true) {
                        gameplay.left()
                    }
            onRight: if (toolbar.rlvisible === true) {
                         gameplay.right()
                     }
            onUp: if (toolbar.rlvisible === true) {
                      gameplay.up()
                  }
            onDown: if (toolbar.rlvisible === true) {
                        gameplay.down()
                    }
        }

        Menupanel {
            id: menupanel

            onResume: {
                gameplay.visible = true
                toolbar.rlvisible = true
                menupanel.visible = false
            }
            onHelp: {
                gameplay.help()
            }
            onNewgame: {
                gameplay.visible = true
                toolbar.rlvisible = true
                menupanel.visible = false
                menupanel.vbr = true
                gameplay.newgame()
            }
            onQuitapp: Qt.quit()
        }

        End {
            id: end
            onMenu: {
                menupanel.vbr = false
                menupanel.visible = true
                end.visible = false
            }
        }
    }
}
