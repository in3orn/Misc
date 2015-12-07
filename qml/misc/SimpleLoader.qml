import VPlay 2.0
import QtQuick 2.0

Item {
    id: item

    property real bigRadius: 15

    property real smallWidth: 10
    property real smallHeight: 10
    property real smallRadius: smallWidth / 2

    property int numOfCirles: 12

    property real dAlpha: 360 / numOfCirles

    property alias running: timer.running

    Repeater {
        id: cirles
        model: numOfCirles

        Rectangle {
            x: bigRadius

            width: smallWidth
            height: smallWidth
            radius: smallRadius

            color: "#333333"

            opacity: index / numOfCirles

            transform: Rotation {
                origin.x: -x
                origin.y: 0
                angle: index * dAlpha
            }
        }
    }

    Timer {
        id: timer

        interval: 100

        repeat: true
        running: true

        onTriggered: {
            item.rotation += dAlpha
        }
    }
}

