import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Background{

        ListModel {
               id: theModel

               ListElement { number: 0 }
               ListElement { number: 1 }
               ListElement { number: 2 }
               ListElement { number: 3 }
               ListElement { number: 4 }
               ListElement { number: 5 }
               ListElement { number: 6 }
               ListElement { number: 7 }
               ListElement { number: 8 }
               ListElement { number: 9 }
           }



        ObjectModel{
            id:objectModel

            Rectangle { height: 60; width: 80; color: "#157efb" }
                   Rectangle { height: 20; width: 300; color: "#53d769"
                       Text { anchors.centerIn: parent; color: "black"; text: "Hello QML" }
                   }
                   Rectangle { height: 40; width: 40; radius: 10; color: "#fc1a1c" }
        }


        ListView{
            anchors{
                fill: parent
                margins: 20
            }

            model: theModel

            spacing: 10

            clip: true

           // orientation: ListView.Horizontal

            focus: true

            delegate: Box{

                id : idDelegate

                required property int index;
                 required property int number;

                radius: 10



                text: index
                color: ListView.isCurrentItem ? "grey" : "lightgrey"

                /*
                gradient: Gradient {
                                GradientStop { position: 0.0; color: "#f8306a" }
                                GradientStop { position: 1.0; color: "#fb5b40" }
                            }*/

                border.color: Qt.lighter(color,2.2)


                width: ListView.view.width
                height: 50




                MouseArea{

                    anchors.fill: parent

                    onClicked: {

                        if(idDelegate.index==-1) return
                        else theModel.remove(idDelegate.index)
                    }


                }


                ListView.onRemove:{
                    removeAnimation.start()
                }


                SequentialAnimation {
                  id: removeAnimation

                PropertyAction { target: idDelegate; property: "ListView.delayRemove"; value: true }
                NumberAnimation { target: idDelegate; property: "scale"; to: 0; duration: 250; easing.type: Easing.InOutQuad }
                PropertyAction { target: idDelegate; property: "ListView.delayRemove"; value: false }
                }


            }



            //highlight : hightlightComponents

            header: headerComponent
            footer: footerComponent





            Component{

                id:hightlightComponent

                Item {
                       width: ListView.view ? ListView.view.width : 0
                       height: ListView.view ? ListView.view.currentItem.height : 0

                       y: ListView.view ? ListView.view.currentItem.y : 0

                       Behavior on y {
                           SequentialAnimation {
                               PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 0; duration: 200 }
                               NumberAnimation { duration: 1 }
                               PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 1; duration: 200 }
                           }
                       }

                       Box {
                           id: highlightRectangle
                           anchors.fill: parent
                       }
                   }
            }

            Component {
                   id: headerComponent

                   Box {
                       width: ListView.view ? ListView.view.width : 0
                       height: 20
                       text: 'Header'
                       color: "lightgreen"

                   }
        }

            Component {
                   id: footerComponent

                   Box {
                       width: ListView.view ? ListView.view.width : 0
                       height: 20
                       text: 'add Item+'
                       color: "lightgreen"

                       MouseArea{
                          anchors.fill: parent
                          // when clicked add a new item to the model data
                          onClicked: {

                               theModel.append({"number":0})
                          }


                       }

                   }
        }


    }

   }
}

