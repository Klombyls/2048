import QtQuick 2.12

Rectangle {
    width: 100
    height: 100
    radius: 6
    //color: "#eee4da"

    property int bricktext
    property string fontcolor
    property string brickcolor
    property bool textvisible

    color: brickcolor
    Text {
        visible: textvisible
        font.family: "Helvetica"
        font.pointSize: 28
        anchors.centerIn: parent
        text: bricktext
        color: fontcolor
    }
}
