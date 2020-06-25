import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

ColumnLayout {
    id: cl
    x: 150

    signal resume()
    signal help()
    signal newgame()
    signal quitapp()
    property bool vbr

    Button {
        text: "Resume"
        visible: vbr
        onClicked: {
            resume()
        }
    }
    Button {
        text: "New Game"
        onClicked: {
            newgame()
        }
    }
    Button {
        text: "Help"
        onClicked: {
            help()
        }
    }
    Button {
        text: "Exit"
        onClicked: {
            quitapp()
        }
    }
}
