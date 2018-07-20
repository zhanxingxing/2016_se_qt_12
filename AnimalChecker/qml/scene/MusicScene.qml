import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../scene"

SceneBase {
    id: musicScene


    BackgroundMusic {
        id: music
        source: "../../assets/audio/japan.mp3"
    }
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "lightblue"
    }
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Music Setting"
    }

    Column {
        anchors.centerIn: parent
        MenuButton {
            text: "On"
            color: "red"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: music.play()
        }

        MenuButton {
            text: "Off"
            color: "yellow"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: music.pause()
        }
    }
    MenuButton {
        text: "menu"

        anchors.right: musicScene.gameWindowAnchorItem.right
        anchors.rightMargin: 15
        anchors.top: musicScene.gameWindowAnchorItem.top
        anchors.topMargin: 15
        onClicked: backButtonPressed()
    }
    MenuButton {
        text: "continue"

        anchors.right: musicScene.gameWindowAnchorItem.right
        anchors.rightMargin: 15
        anchors.bottom: musicScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: 15
        onClicked: gameWindow.state = "start"
    }
}
