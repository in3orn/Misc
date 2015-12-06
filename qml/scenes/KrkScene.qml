import VPlay 2.0
import QtQuick 2.0

Scene {
    id: scene

    width: 256
    height: 256

    opacity: 0
    visible: opacity > 0

    Rectangle {
        anchors.fill: parent
        color: "white"
    }

    states: [
        State {
            name: "hidden"
            PropertyChanges { target: scene; opacity: 0 }
        },
        State {
            name: "shown"
            PropertyChanges { target: scene; opacity: 1 }
        }
    ]

    transitions: Transition {
        from: "hidden"
        to: "shown"

        reversible: true

        animations:
            NumberAnimation {
            target: scene
            property: "opacity"
            duration: 1000
            easing.type: Easing.InOutQuad
        }
    }
}

