import VPlay 2.0
import QtQuick 2.0

Rectangle {
    id: progressBar

    property real progress: 0

    width: 100
    height: 20

    color: "white"
    border {
        width: 2
        color: "#333333"
    }

    Text {
        id: progressBarText
        text: qsTr("Loading...")
        color: "#333333"
        anchors.centerIn: parent
    }

    Rectangle {
        id: progressBarFront

        width: parent.width * progressBar.progress
        height: parent.height

        color: "#333333"

        clip: true

        Text {
            id: progressBarFrontText
            text: qsTr("Loading...")
            color: "white"
            x: progressBarText.x
            y: progressBarText.y
        }
    }
}
