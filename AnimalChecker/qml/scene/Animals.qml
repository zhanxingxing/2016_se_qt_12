import QtQuick 2.0
import VPlay 2.0
import "../common"

EntityBase {
    id: chess
    property alias image: animal_image.source
    property alias eentityType: chess.entityType
    //property alias target: other.getBody().target
    //property alias animalsEnemy: chess.x
    width: 40
    height: 40
    entityType: "red"
    property int level
    signal check_on
    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("dsadsadsa")
            check_on()
        }
    }

    BoxCollider {
        id: box
        anchors.fill: animal_image
        fixture.onBeginContact: {
            var impact = other.getBody().target
            //bodyType: Body.
            console.log("dsalfsa")
            if (impact.entityType === "green") {
                if (impact.level > chess.level)
                    removeEntity()
            }
        }
    }
    Image {
        id: animal_image
        anchors.fill: parent
    }
}
