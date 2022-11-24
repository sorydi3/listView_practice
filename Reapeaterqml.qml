import QtQuick

Column{
   //anchors.fill: parent
   anchors.centerIn: parent


   spacing: 5


   Repeater{

       model: ListModel{

          ListElement{name:"Mercury"; surfaceColor:"gray"}
          ListElement { name: "Venus"; surfaceColor: "yellow" }
          ListElement { name: "Earth"; surfaceColor: "blue" }
          ListElement { name: "Mars"; surfaceColor: "orange" }
          ListElement { name: "Jupiter"; surfaceColor: "orange" }
          ListElement { name: "Saturn"; surfaceColor: "yellow" }
          ListElement { name: "Uranus"; surfaceColor: "lightBlue" }
          ListElement { name: "Neptune"; surfaceColor: "lightBlue" }


       }
       delegate: Rectangle{

           id: idDelegate

           required property string name;
           required property string surfaceColor;

           required property int index;

           width: 100

           color: "lightblue"
           height: 32

           radius: 10

               Text {
                   id: idText
                   text: name
                   anchors.centerIn: parent
               }


               Box{

                   width: 16
                   height: 16

                    anchors{
                        left:parent.left
                        verticalCenter:parent.verticalCenter
                        leftMargin: 5
                    }


                    radius: 8
                    color : idDelegate.surfaceColor


               }


           }

        }


   }
