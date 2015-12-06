import VPlay 2.0
import QtQuick 2.0

import "scenes"

GameWindow {
    id: gameWindow

    width: 512
    height: 512

    state: "menuScene"

    //licenseKey: ""

    MenuScene {
        id: menuScene

        onSimpleProgressBarClicked: gameWindow.state = "simpleProgressBarScene"
    }

    SimpleProgressBarScene {
        id: simpleProgressBarScene
        onBackButtonPressed: gameWindow.state = "menuScene"
    }

    Timer {
        id: recorder
        interval: 50
        repeat: true

        property string path: "D:/Graphics/Misc/"
        property string name: ""

        property int maxNumber: 20
        property int number: 0

        property bool on: true

        onTriggered: {
            var prefix = "";
            if(number < 0) prefix += "0";
            ScreenCapture.capture(path + name + "_" + prefix + number + ".png");
            number++;
            if(number >= maxNumber) stop();
        }

        onNameChanged: {
            console.debug("[Recorder] on: " + on);
            console.debug("[Recorder] name: " + name);
            if(on && name.length > 0) recorder.record();
        }

        function record() {
            number = 0;
            start();
        }
    }

    states: [
        State {
            name: "menuScene"
            PropertyChanges { target: menuScene; state: "shown" }
            PropertyChanges { target: gameWindow; activeScene: menuScene }
        },
        State {
            name: "simpleProgressBarScene"
            PropertyChanges { target: recorder; name: "SimpleProgressBar" }
            PropertyChanges { target: simpleProgressBarScene; state: "shown" }
            PropertyChanges { target: gameWindow; activeScene: simpleProgressBarScene }
        }
    ]
}

