import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

ColumnLayout {
    signal quitapp()
    signal menu()

    property bool win
    property bool lose

    property int result
    property int record

    Rectangle {
        visible: win
        width: 100
        height: 40
        Text {
            text: "You WON"
            color: "green"
            anchors.centerIn: parent
            font.family: "Helvetica"
            font.pointSize: 14
        }
    }
    Rectangle {
        visible: lose
        width: 100
        height: 40
        Text {
            text: "You LOSE"
            color: "red"
            anchors.centerIn: parent
            font.family: "Helvetica"
            font.pointSize: 14
        }
    }
    Rectangle {
        width: 100
        height: 40
        Text {
            text: "Your result\n" + result
            anchors.centerIn: parent
            font.family: "Helvetica"
            font.pointSize: 12
        }
    }
    Rectangle {
        width: 100
        height: 40
        Text {
            text: "Record\n" + record
            anchors.centerIn: parent
            font.family: "Helvetica"
            font.pointSize: 12
        }
    }

    Button {
        id: buttmenu
        text: "Menu"
        onClicked: {
            menu()
        }
    }
}
