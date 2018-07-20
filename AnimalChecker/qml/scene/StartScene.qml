import QtQuick 2.0
import VPlay 2.0
import "../common"

SceneBase {

    id: startScene

    PhysicsWorld {
        debugDrawVisible: false
    }

    Rectangle {
        id: bgcolor
        color: "white"
        anchors.fill: startScene.gameWindowAnchorItem
    }
    signal startPressed(string start)
    property int gridWidth: 360
    property int gridInitValue: 17
    property int gridHeight: 280
    property int gridSizeH: 7
    property int gridSizeV: 9
    property int gridSizeGameSqured: gridSizeH * gridSizeV
    property int chess_x
    property int chess_y
    property int chess_i
    property bool moving: false

    Grid {
        id: tileGrid

        anchors.centerIn: parent

        spacing: 1

        rows: gridSizeH
        Repeater {
            id: cells
            anchors.centerIn: parent
            model: gridSizeGameSqured

            Item {
                width: gridWidth / gridSizeV
                height: gridHeight / gridSizeH
                Rectangle {
                    DropArea {
                        anchors.fill: parent
                    }

                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height
                    color: "gold"
                }
            }
        }
    }

    MenuButton {
        text: "Menu"
        color: "transparent"

        anchors.right: startScene.gameWindowAnchorItem.right
        anchors.rightMargin: 0
        anchors.top: startScene.gameWindowAnchorItem.top
        anchors.topMargin: 0
        onClicked: backButtonPressed()
    }

    MenuButton {

        text: "Music"
        color: "transparent"
        anchors.right: startScene.gameWindowAnchorItem.right
        anchors.rightMargin: 0
        anchors.bottom: startScene.gameWindowAnchorItem.bottom
        anchors.topMargin: 0
        onClicked: gameWindow.state = "Music"
    }
    MenuButton {

        text: "Fail"
        color: "transparent"
        anchors.right: startScene.gameWindowAnchorItem.right
        anchors.rightMargin: 0
        anchors.top: startScene.gameWindowAnchorItem.top
        anchors.topMargin: 40
        onClicked: gameWindow.state = "over"
    }

    Rectangle {
        id: trap1_left
        width: gridWidth / gridSizeV
        height: gridHeight / gridSizeH
        x: (gridWidth / gridSizeV) + 16
        y: 9 * (gridWidth / gridSizeV) / 4 + 9
        color: "gold"
        Image {
            id: trap1_l
            width: gridWidth / gridSizeV
            height: gridHeight / gridSizeH
            source: "../../assets/trap_1.png"
        }
    }
    Rectangle {
        id: trap2_left
        width: gridWidth / gridSizeV
        height: gridHeight / gridSizeH
        x: 2 * (gridWidth / gridSizeV) + 17
        y: 13 * (gridWidth / gridSizeV) / 4 + 10
        color: "gold"
        Image {
            id: trap2_l
            width: gridWidth / gridSizeV
            height: gridHeight / gridSizeH
            source: "../../assets/trap_1.png"
        }
    }
    Rectangle {
        id: trap3_left
        width: gridWidth / gridSizeV
        height: gridHeight / gridSizeH
        x: (gridWidth / gridSizeV) + 17
        y: 17 * (gridWidth / gridSizeV) / 4 + 11
        color: "gold"
        Image {
            id: trap3_l
            width: gridWidth / gridSizeV
            height: gridHeight / gridSizeH
            source: "../../assets/trap_1.png"
        }
    }
    Rectangle {
        id: trap1_right
        width: gridWidth / gridSizeV
        height: gridHeight / gridSizeH
        anchors.right: tileGrid.right
        x: 9 * (gridWidth / gridSizeV) + 25
        y: 9 * (gridWidth / gridSizeV) / 4 + 9
        color: "gold"
        Image {
            id: trap1_r
            width: gridWidth / gridSizeV
            height: gridHeight / gridSizeH
            source: "../../assets/trap_2.png"
        }
    }
    Rectangle {
        id: trap2_right
        width: gridWidth / gridSizeV
        height: gridHeight / gridSizeH
        x: 8 * (gridWidth / gridSizeV) + 23
        y: 13 * (gridWidth / gridSizeV) / 4 + 10
        color: "gold"
        Image {
            id: trap2_r
            width: gridWidth / gridSizeV
            height: gridHeight / gridSizeH
            source: "../../assets/trap_2.png"
        }
    }
    Rectangle {
        id: trap3_right
        width: gridWidth / gridSizeV
        height: gridHeight / gridSizeH
        x: 9 * (gridWidth / gridSizeV) + 25
        y: 17 * (gridWidth / gridSizeV) / 4 + 11
        color: "gold"
        Image {
            id: trap3_r
            width: gridWidth / gridSizeV
            height: gridHeight / gridSizeH
            source: "../../assets/trap_2.png"
        }
    }
    Rectangle {
        id: cave_left
        width: gridWidth / gridSizeV
        height: gridHeight / gridSizeH
        anchors.left: tileGrid.left
        x: (gridWidth / gridSizeV) + 17
        y: 13 * (gridWidth / gridSizeV) / 4 + 10

        color: "lightgreen"
        Text {
            text: "Cave"
            font.pixelSize: 10
            anchors.centerIn: parent
            color: "black"
        }
    }
    Rectangle {
        id: cave_right
        width: gridWidth / gridSizeV
        height: gridHeight / gridSizeH
        anchors.right: tileGrid.right
        x: 9 * (gridWidth / gridSizeV) + 25
        y: 13 * (gridWidth / gridSizeV) / 4 + 10
        color: "lightgreen"
        Text {
            text: "Cave"
            font.pixelSize: 10
            anchors.centerIn: parent
            color: "black"
        }
    }
    Rectangle {
        id: river1
        width: (gridWidth / gridSizeV) * 3 + 2
        height: (gridHeight / gridSizeH) * 2 + 1
        x: (gridWidth / gridSizeV) * 4 + 19
        y: (gridHeight / gridSizeH) * 1 + 18
        Image {
            id: river_1
            width: (gridWidth / gridSizeV) * 3 + 2
            height: (gridHeight / gridSizeH) * 2 + 1
            source: "../../assets/river.png"
        }
    }
    Rectangle {
        id: river2
        width: (gridWidth / gridSizeV) * 3 + 2
        height: (gridHeight / gridSizeH) * 2 + 1
        x: (gridWidth / gridSizeV) * 4 + 19
        y: (gridHeight / gridSizeH) * 4 + 21
        Image {
            id: river_2
            width: (gridWidth / gridSizeV) * 3 + 2
            height: (gridHeight / gridSizeH) * 2 + 1
            source: "../../assets/river.png"
        }
    }

    //    property int check_x
    //    property int check_y
    //    property bool check_state: false
    //    signal changeover
    //    MouseArea {
    //        anchors.fill: parent
    //        onReleased: {
    //            if (check_state == true) {
    //                var coord = othersMove(mouse.x, mouse.y, check_x, check_y)
    //                check_x = coord[0]
    //                check_y = coord[1]
    //                changeover()
    //            }
    //        }
    //    }
    Animals {
        id: elephant_red
        x: (gridWidth / gridSizeV) * 3 + 18
        y: (gridWidth / gridSizeV) / 4 + 7
        image: "../../assets/elephent_1.png"
        entityType: "red_elephent"
        level: 8
        MouseArea {
            id: mouse_area1
            anchors.fill: parent
            onReleased: {
                var coord = othersMove(mouse.x, mouse.y, elephant_red.x,
                                       elephant_red.y)
                elephant_red.x = coord[0]
                elephant_red.y = coord[1]
                overJudgeLeft(elephant_red.x, elephant_red.y)
            }
        }

        /*   property bool checkState: false
        onCheck_on: {
            check_x = elephant_red.x
            check_y = elephant_red.y
            checkState = true
            check_state = checkState
        }
        Connections {
            target: startScene
            onChangeover: {
                elephant_red.x = check_x
                elephant_red.y = check_y
                elephant_red.checkState = false
                check_state = false
            }
        }*/
    }
    Animals {
        id: lion_red
        x: (gridWidth / gridSizeV) + 16
        y: 6 * (gridWidth / gridSizeV) + 23
        image: "../../assets/lion_1.png"
        level: 7

        MouseArea {
            id: mouse_area2
            anchors.fill: parent
            onReleased: {
                var coord = t_lionMove(mouse.x, mouse.y, lion_red.x, lion_red.y)
                lion_red.x = coord[0]
                lion_red.y = coord[1]
                overJudgeLeft(lion_red.x, lion_red.y)
            }
        }
    }

    Animals {
        id: tiger_red
        x: (gridWidth / gridSizeV) + 16
        y: (gridWidth / gridSizeV) / 4 + 7
        image: "../../assets/tiger_1.png"
        level: 6
        //animalsEnemy: 6
        MouseArea {
            id: mouse_area3
            anchors.fill: parent
            onReleased: {
                var coord = t_lionMove(mouse.x, mouse.y, tieger_red.x,
                                       tiger_red.y)
                tiger_red.x = coord[0]
                tiger_red.y = coord[1]
                overJudgeLeft(tiger_red.x, tiger_red.y)
            }
        }
    }
    Animals {
        id: leopard_red
        x: (gridWidth / gridSizeV) * 3 + 18
        y: 17 * (gridHeight / gridSizeH) / 4 + 11
        image: "../../assets/leopard_1.png"
        level: 5
        //animalsEnemy: 5
        MouseArea {
            id: mouse_area4
            anchors.fill: parent
            onReleased: {
                var coord = othersMove(mouse.x, mouse.y, leopard_red.x,
                                       leopard_red.y)
                leopard_red.x = coord[0]
                leopard_red.y = coord[1]
                overJudgeLeft(leopard_red.x, leopard_red.y)
            }
        }
    }
    Animals {
        id: wolf_red
        x: (gridWidth / gridSizeV) * 3 + 18
        y: 9 * (gridWidth / gridSizeV) / 4 + 9
        image: "../../assets/wolf_1.png"
        level: 4
        //animalsEnemy: 4
        MouseArea {
            id: mouse_area5
            anchors.fill: parent

            onReleased: {
                var coord = othersMove(mouse.x, mouse.y, wolf_red.x, wolf_red.y)
                wolf_red.x = coord[0]
                wolf_red.y = coord[1]
                overJudgeLeft(wolf_red.x, wolf_red.y)
                console.log(wolf_red.x, wolf_red.y)
            }
        }
    }

    Animals {
        id: dog_red
        x: (gridWidth / gridSizeV) * 2 + 17
        y: 21 * (gridWidth / gridSizeV) / 4 + 12
        image: "../../assets/dog_1.png"
        level: 3
        //animalsEnemy: 3
        MouseArea {
            id: mouse_area6
            anchors.fill: parent
            onReleased: {
                var coord = othersMove(mouse.x, mouse.y, dog_red.x, dog_red.y)
                dog_red.x = coord[0]
                dog_red.y = coord[1]
                overJudgeLeft(dog_red.x, dog_red.y)
            }
        }
    }

    Animals {
        id: cat_red
        x: (gridWidth / gridSizeV) * 2 + 17
        y: (5 * (gridHeight / gridSizeH)) / 4 + 8
        image: "../../assets/cat_1.png"
        level: 2
        //animalsEnemy: 2
        MouseArea {
            id: mouse_area7
            anchors.fill: parent
            onReleased: {
                var coord = othersMove(mouse.x, mouse.y, cat_red.x, cat_red.y)
                cat_red.x = coord[0]
                cat_red.y = coord[1]
                overJudgeLeft(cat_red.x, cat_red.y)
            }
        }
    }
    Animals {
        id: mouse_red
        x: (gridWidth / gridSizeV) * 3 + 18
        y: 6 * (gridWidth / gridSizeV) + 23
        image: "../../assets/mouse_1.png"
        level: 1

        MouseArea {
            id: mouse_area8
            anchors.fill: parent
            onReleased: {

                var coord = mouseMove(mouse.x, mouse.y, mouse_red.x,
                                      mouse_red.y)
                mouse_red.x = coord[0]
                mouse_red.y = coord[1]

                overJudgeLeft(mouse_red.x, mouse_red.y)
            }
        }
    }

    EmAnimal {
        id: elephant_green
        x: (gridWidth / gridSizeV) * 7 + 22
        y: 6 * (gridWidth / gridSizeV) + 23
        image: "../../assets/elephent_2.png"
        level: 8

        MouseArea {
            id: mouse_area1_g
            anchors.fill: parent
            onReleased: {
                var coord = othersMove(mouse.x, mouse.y, elephant_green.x,
                                       elephant_green.y)
                elephant_green.x = coord[0]
                elephant_green.y = coord[1]
                overJudgeRight(elephant_green.x, elephant_green.y)
            }
        }
    }
    EmAnimal {
        id: lion_green
        x: 9 * (gridWidth / gridSizeV) + 24
        y: (gridWidth / gridSizeV) / 4 + 7
        image: "../../assets/lion_2.png"
        level: 7

        MouseArea {
            id: mouse_area2_g
            anchors.fill: parent
            onReleased: {
                var coord = t_lionMove(mouse.x, mouse.y, lion_green.x,
                                       lion_green.y)
                lion_green.x = coord[0]
                lion_green.y = coord[1]
                overJudgeRight(lion_green.x, lion_green.y)
            }
        }
    }
    EmAnimal {
        id: tiger_green
        x: 9 * (gridWidth / gridSizeV) + 24
        y: 25 * (gridWidth / gridSizeV) / 4 + 13
        image: "../../assets/tiger_2.png"
        level: 6

        MouseArea {
            id: mouse_area3_g
            anchors.fill: parent
            onReleased: {
                var coord = t_lionMove(mouse.x, mouse.y, tiger_green.x,
                                       tiger_green.y)
                tiger_green.x = coord[0]
                tiger_green.y = coord[1]
                overJudgeRight(tiger_green.x, tiger_green.y)
            }
        }
    }
    EmAnimal {
        id: leopard_green
        x: (gridWidth / gridSizeV) * 7 + 22
        y: 9 * (gridHeight / gridSizeH) / 4 + 9
        image: "../../assets/leopard_2.png"
        level: 5
        MouseArea {
            id: mouse_area4_g
            anchors.fill: parent
            onReleased: {
                var coord = othersMove(mouse.x, mouse.y, leopard_green.x,
                                       leopard_green.y)
                leopard_green.x = coord[0]
                leopard_green.y = coord[1]
                overJudgeRight(leopard_green.x, leopard_green.y)
            }
        }
    }
    EmAnimal {
        id: wolf_green
        x: (gridWidth / gridSizeV) * 7 + 22
        y: 17 * (gridWidth / gridSizeV) / 4 + 11
        image: "../../assets/wolf_2.png"
        level: 4

        MouseArea {
            id: mouse_area5_g
            anchors.fill: parent
            onReleased: {
                var coord = othersMove(mouse.x, mouse.y, wolf_green.x,
                                       wolf_green.y)
                wolf_green.x = coord[0]
                wolf_green.y = coord[1]
                overJudgeRight(wolf_green.x, wolf_green.y)
            }
        }
    }

    EmAnimal {
        id: dog_green
        x: (gridWidth / gridSizeV) * 8 + 23
        y: 5 * (gridWidth / gridSizeV) / 4 + 8
        image: "../../assets/dog_2.png"
        level: 3

        MouseArea {
            id: mouse_area6_g
            anchors.fill: parent
            onReleased: {

                var coord = othersMove(mouse.x, mouse.y, dog_green.x,
                                       dog_green.y)
                dog_green.x = coord[0]
                dog_green.y = coord[1]
                overJudgeRight(dog_green.x, dog_green.y)
            }
        }
    }

    EmAnimal {
        id: cat_green
        x: (gridWidth / gridSizeV) * 8 + 23
        y: (21 * (gridHeight / gridSizeH)) / 4 + 12
        image: "../../assets/cat_2.png"
        level: 2

        MouseArea {
            id: mouse_area7_g
            anchors.fill: parent
            onReleased: {
                var coord = othersMove(mouse.x, mouse.y, cat_green.x,
                                       cat_green.y)
                cat_green.x = coord[0]
                cat_green.y = coord[1]
                overJudgeRight(cat_green.x, cat_green.y)
            }
        }
    }
    EmAnimal {
        id: mouse_green
        x: (gridWidth / gridSizeV) * 7 + 22
        y: (gridWidth / gridSizeV) / 4 + 7
        image: "../../assets/mouse_2.png"
        level: 1

        MouseArea {
            id: mouse_area8_g
            anchors.fill: parent
            onReleased: {
                var coord = mouseMove(mouse.x, mouse.y, mouse_green.x,
                                      mouse_green.y)
                mouse_green.x = coord[0]
                mouse_green.y = coord[1]

                overJudgeRight(mouse_green.x, mouse_green.y)
            }
        }
    }
}
