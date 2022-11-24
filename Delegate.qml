import QtQuick

Item {

    id: idDelegate
    property alias text: textid.text

    Rectangle {
               id: wrapper

               required property int index

               width: ListView.view.width
               height: 40

               color: ListView.isCurrentItem ? "#157efb" : "#53d769"
               border.color: Qt.lighter(color, 1.1)

               Text {
                   id : textid
                   anchors.centerIn: parent

                   font.pixelSize: 10

                   text: wrapper.index
               }
           }

}
