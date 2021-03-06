import VPlay 2.0
import QtQuick 2.0

import QtQuick.Layouts 1.1

KrkScene {
    id: scene

    readonly property int normalFontSize: 18

    signal simpleLoaderClicked()
    signal simpleProgressBarClicked()

    ScrollViewVPlay {
        id: scrollView

        anchors.fill: parent
        anchors.margins: dp(20)

        flickableItem.interactive: true

        ColumnLayout {
            id: buttons

            spacing: dp(10)
            width: scrollView.width //parent not working

            ButtonVPlay {
                text: qsTr("Simple loader")
                onClicked: simpleLoaderClicked()
                Layout.alignment: Qt.AlignHCenter
            }

            ButtonVPlay {
                text: qsTr("Simple progress bar")
                onClicked: simpleProgressBarClicked()
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }
}

