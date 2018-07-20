import QtQuick 2.0
import VPlay 2.0
import "../common"

SceneBase {
    id: creditScene
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#49a349"
        Column {
            anchors.centerIn: parent
            Text {
                //                anchors.centerIn: parent
                font.pixelSize: 12
                //                color: "red"
                text: "鼠可以吃鼠、象；猫可以吃猫、鼠；狗可以吃狗、猫、鼠；狼可以吃狼、狗、猫、鼠；"
            }
            Text {
                font.pixelSize: 12
                //                color: "red"
                text: "豹可以吃豹、狼、狗、猫、鼠；虎可以吃虎、豹、狼、狗、猫、鼠；狮可以吃狮、虎、"
            }
            Text {
                font.pixelSize: 12
                text: "豹、狼、狗、猫、鼠；象可以吃象、狮、虎、豹、狼、狗、猫；狮子可跳纵横河，虎只"
            }
            Text {
                font.pixelSize: 12
                text: "可跳横河，而且可以直接把对岸的动物吃掉。可是若小河中有鼠（无论是敌方或是己方)"
            }
            Text {
                font.pixelSize: 12
                text: "狮、虎便不可跳河。陷阱：棋盘设陷阱，专为限制敌兽的战斗力（自己的兽不受限制）,"
            }
            Text {
                font.pixelSize: 12
                text: "敌兽走入陷阱，即失去战斗力，本方的任意兽类都可以吃去陷阱里的兽类。任何一方的"
            }
            Text {
                font.pixelSize: 12
                text: "兽走入敌方的兽穴就算胜利（自己的兽类不可以走入自己的兽穴）任何一方的兽被吃光"
            }
            Text {
                font.pixelSize: 12
                text: "就算失败，对方获胜!"
            }
        }
    }

    MenuButton {
        text: "Back"

        anchors.right: creditsScene.gameWindowAnchorItem.right
        anchors.rightMargin: 15
        anchors.top: creditsScene.gameWindowAnchorItem.top
        anchors.topMargin: 15
        onClicked: backButtonPressed()
    }
}
