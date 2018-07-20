import QtQuick 2.2
import VPlay 2.0
import "common"
import "scene"

GameWindow {
    id: gameWindow
    screenWidth: 960
    screenHeight: 640

    property int gridWidth: 360
    property int gridHeight: 280
    property int gridSizeH: 7
    property int gridSizeV: 9
    property int gridSizeGameSqured: gridSizeH * gridSizeV
    property var emptyCells
    property var tileItems: new Array(gridSizeGameSqured)

    EntityManager {
        id: entityManager
    }
    MenuScene {
        id: menuScene
        onStartPressed: gameWindow.state = "start"
        onCreditsPressed: gameWindow.state = "credits"


        onBgmPressed: gameWindow.state = "Music"
        onQuitPressed: gameWindow.state = Qt.quit()
        onBackButtonPressed: {
            nativeUtils.displayMessageBox("Really quit the game?", "", 2)
        }
        Connections {
            target: nativeUtils
            onMessageBoxFinished: {
                if (accepted && window.activeScene === menuScene)
                    Qt.quit()
            }
        }
    }
    StartScene {
        id: startScene

        onStartPressed: {

            startScene.start(start)
            gameWindow.state = "game"
        }
        onBackButtonPressed: gameWindow.state = "menu"
    }
    MusicScene {
        id: bgmScene
        onBackButtonPressed: gameWindow.state = "menu"
    }
    OverScene {
        id: overScene
        onBackButtonPressed: gameWindow.state = "menu"
    }

    // credits scene
    CreditScene {
        id: creditsScene
        onBackButtonPressed: gameWindow.state = "menu"
    }
    state: "menu"
    activeScene: menuScene

    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: menuScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: menuScene
            }
        },
        State {
            name: "start"
            PropertyChanges {
                target: startScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: startScene
            }
        },
        State {
            name: "single"
            PropertyChanges {
                target: startScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: startScene
            }
        },
        State {
            name: "Music"
            PropertyChanges {
                target: bgmScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: bgmScene
            }
        },
        State {
            name: "credits"
            PropertyChanges {
                target: creditsScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: creditsScene
            }
        },
        State {
            name: "over"
            PropertyChanges {
                target: overScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: overScene
            }
        }
    ]
    function mouseMove(mouseX, mouseY, X, Y) //老鼠移动，老鼠可以下水
    {

        var coord = new Array(2)
        coord[0] = X
        coord[1] = Y
        if (mouseX > 41 && mouseX < 82 && mouseY < 41 && mouseY >= 0
                && mouseY < 384) {

            coord[0] += 41 //move_right

        } else {
            coord[0] += 0 // Border
        }
        if (mouseX < 0 && mouseY > -41 && mouseX < 41 && mouseY >= 0
                && coord[0] > 56) {
            coord[0] -= 41
        } else {
            coord[0] -= 0 //Border
        }

        if (mouseY > 41 && mouseY < 82 && mouseX < 41 && mouseX >= 0
                && coord[1] < 263) {
            coord[1] += 41
        } else {
            coord[1] += 0 //Border
        }

        if (mouseY < 0 && mouseY > -41 && mouseX < 41 && mouseX >= 0
                && coord[1] > 17) {
            coord[1] -= 41
        } else {
            coord[1] -= 0 //Border
        }

        return coord
    }
    function othersMove(mouseX, mouseY, X, Y) // 除老虎狮子老鼠之外其他动物的移动，不能下水
    {

        var coord = new Array(2)
        coord[0] = X
        coord[1] = Y
        if (mouseX > 41 && mouseX < 82 && mouseY < 41 && mouseY >= 0
                && mouseY < 384) {
            coord[0] += 41

            if ((coord[0] === 179 && coord[1]
                 === 99) || (coord[0] === 179 && coord[1]
                             === 222) || (coord[0] === 179 && coord[1]
                                          === 181) || (coord[0] === 179 && coord[1] === 58)) {
                coord[0] -= 41
            }
        } else {
            coord[0] += 0 // Border
        }
        if (mouseX < 0 && mouseY > -41 && mouseX < 41 && mouseY >= 0
                && coord[0] > 56) {
            coord[0] -= 41

            if ((coord[0] === 261 && coord[1] === 99) || (coord[0] === 261 && coord[1] === 181) || (coord[0] === 261 && coord[1] === 222) || (coord[0] === 179 && coord[1] === 181) || (coord[0] === 220 && coord[1] === 181) || (coord[0] === 261 && coord[1] === 181) || (coord[0] === 261 && coord[1] === 58)) {
                coord[0] += 41
            } //向前拖动，会原地不动
        } else {
            coord[0] -= 0 //Border
        }

        if (mouseY > 41 && mouseY < 82 && mouseX < 41 && mouseX >= 0
                && coord[1] < 263) {
            coord[1] += 41
            if ((coord[0] === 179 && coord[1] === 58) || (coord[0] === 220 && coord[1] === 58) || (coord[0] === 261 && coord[1] === 58) || (coord[0] === 261 && coord[1] === 181) || (coord[0] === 220 && coord[1] === 181) || (coord[0] === 179 && coord[1] === 181))
                coord[1] -= 41
            //move_down
        } else {
            coord[1] += 0 //Border
        }

        if (mouseY < 0 && mouseY > -41 && mouseX < 41 && mouseX >= 0
                && coord[1] > 17) {
            coord[1] -= 41
        }
        if ((coord[0] === 179 && coord[1] === 99) || (coord[0] === 220 && coord[1] === 99) || (coord[0] === 261 && coord[1] === 99) || (coord[0] === 179 && coord[1] === 222) || (coord[0] === 220 && coord[1] === 222) || (coord[0] === 261 && coord[1] === 222)) {
            coord[1] += 41 // 会原地不动
        } else {
            coord[1] -= 0 //Border
        }

        return coord
    }
    function t_lionMove(mouseX, mouseY, X, Y) //老虎，狮子的移动（即可以跳过河流）
    {
        var coord = new Array(2)
        coord[0] = X
        coord[1] = Y
        if (mouseX > 41 && mouseX < 82 && mouseY < 41 && mouseY >= 0
                && mouseY < 384) {
            coord[0] += 41

            if ((coord[0] === 179 && coord[1]
                 === 99) || (coord[0] === 179 && coord[1]
                             === 222) || (coord[0] === 179 && coord[1]
                                          === 181) || (coord[0] === 179 && coord[1] === 58)) {
                coord[0] += 123
            }
        } else {
            coord[0] += 0 // Border
        }
        if (mouseX < 0 && mouseY > -41 && mouseX < 41 && mouseY >= 0
                && coord[0] > 56) {
            coord[0] -= 41

            if ((coord[0] === 261 && coord[1] === 99) || (coord[0] === 261 && coord[1] === 181) || (coord[0] === 261 && coord[1] === 222) || (coord[0] === 179 && coord[1] === 181) || (coord[0] === 220 && coord[1] === 181) || (coord[0] === 261 && coord[1] === 181) || (coord[0] === 261 && coord[1] === 58)) {
                coord[0] -= 123
            } //move_left
        } else {
            coord[0] -= 0 //Border
        }

        if (mouseY > 41 && mouseY < 82 && mouseX < 41 && mouseX >= 0
                && coord[1] < 263) {
            coord[1] += 41
            if ((coord[0] === 179 && coord[1] === 58) || (coord[0] === 220 && coord[1] === 58) || (coord[0] === 261 && coord[1] === 58) || (coord[0] === 261 && coord[1] === 181) || (coord[0] === 220 && coord[1] === 181) || (coord[0] === 179 && coord[1] === 181))
                coord[1] += 82
            //move_down
        } else {
            coord[1] += 0 //Border
        }

        if (mouseY < 0 && mouseY > -41 && mouseX < 41 && mouseX >= 0
                && coord[1] > 17) {
            coord[1] -= 41
        }
        if ((coord[0] === 179 && coord[1] === 99) || (coord[0] === 220 && coord[1] === 99) || (coord[0] === 261 && coord[1] === 99) || (coord[0] === 179 && coord[1] === 222) || (coord[0] === 220 && coord[1] === 222) || (coord[0] === 261 && coord[1] === 222)) {
            coord[1] -= 82 // move_up
        } else {
            coord[1] -= 0 //Border
        }

        return coord
    }

    function overJudgeLeft(X, Y) //判断左边动物是否进入右边巢穴
    {
        if (X === 384 && Y === 140) {
            gameWindow.state = "over"
        }
    }
    function overJudgeRight(X, Y) //判断右边动物是否进入左边巢穴
    {
        if (X === 56 && Y === 140) {
            gameWindow.state = "over"
        }
    }
}
