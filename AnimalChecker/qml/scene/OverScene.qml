import QtQuick 2.0
import VPlay 2.0
import "../common"

SceneBase {
    id: overScene
    signal gameagain

    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#49a349"
    }

    MenuButton {
        text: "menu"

        anchors.right: overScene.gameWindowAnchorItem.right
        anchors.rightMargin: 15
        anchors.top: overScene.gameWindowAnchorItem.top
        anchors.topMargin: 15
        onClicked: backButtonPressed()
    }
    MenuButton {
        text: "Again"

        anchors.right: overScene.gameWindowAnchorItem.right
        anchors.rightMargin: 15
        anchors.top: overScene.gameWindowAnchorItem.top
        anchors.topMargin: 40
        onClicked: {

            console.log(" board is new")

            gameagain()
        }
    }
    MenuButton {
        text: "quit"

        anchors.right: overScene.gameWindowAnchorItem.right
        anchors.rightMargin: 15
        anchors.top: overScene.gameWindowAnchorItem.top
        anchors.topMargin: 70
        onClicked: Qt.quit()
    }

    Text {
        text: " Game Over !"
        color: "red"
        font.pixelSize: 25
        anchors.centerIn: parent
    }
}
