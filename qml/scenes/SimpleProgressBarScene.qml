import VPlay 2.0
import QtQuick 2.0

import "../misc"

KrkScene {
    id: scene

    SimpleProgressBar {
        id: progressBar
        anchors.centerIn: parent
    }

    Timer {
        id: timer

        interval: 50

        repeat: true

        onTriggered: {
            progressBar.progress += 0.05
            if(progressBar.progress > 1)
                progressBar.progress -= 1
        }
    }

    onStateChanged: if(state === "shown") timer.start()
}

