import QtQuick 2.0
import VPlay 2.0
import "../common"

SceneBase {
    id: menuScene

    signal startPressed
    signal creditsPressed
    signal quitPressed
    signal bgmPressed

    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#47688e"
    }
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Animal Chess"
    }
    Column {
        anchors.centerIn: parent
        MenuButton {
            text: "Start"
            color: "yellow"
            onClicked: startPressed()
        }
        MenuButton {
            text: "Music"
            color: "lightblue"
            onClicked: bgmPressed()
        }

        MenuButton {
            text: "Rules"
            color: "white"
            onClicked: creditsPressed()
        }
        MenuButton {
            text: "Quit"
            color: "red"
            onClicked: quitPressed()
        }
    }
}
