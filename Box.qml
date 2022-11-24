import QtQuick

Rectangle {

    property alias text: textLabel.text

    Text {
        anchors.centerIn: parent
        id: textLabel
    }
}
