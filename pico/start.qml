import QtQuick 2.10
import QtQuick.Controls 2.10
import QtQuick.Layouts 1.10

import Pico 1.0

ApplicationWindow {
    id: appRoot

    width: 640
    height: 480
    visible: true

    header: Rectangle {
        width: parent.width
        height: 40
        color: "#ffffff"

        RowLayout {
            Button {
                text: "<-"
                enabled: moduleLoader.hasPrevious
                onClicked: {
                    moduleLoader.previousModule()
                }
            }
            Button {
                text: "->"
                enabled: moduleLoader.hasNext
                onClicked: {
                    moduleLoader.nextModule()
                }
            }
        }
    }

    ModuleLoader {
        id: moduleLoader

        Component.onCompleted: {
            moduleLoader.nextModule()
        }
    }

    Connections {
        target: moduleLoader

        function onLoadNextModule(url) {
            appStack.push("file:///" + url)
        }
    }

    StackView {
        property int animationDuration: 300
        property int easingType: Easing.InOutExpo

        id: appStack
        anchors.fill: parent

        pushEnter: Transition {
            PropertyAnimation {
                property: "x"
                easing.type: appStack.easingType
                from: appStack.width
                to: 0
                duration: appStack.animationDuration
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "x"
                easing.type: appStack.easingType
                from: 0
                to: -appStack.width
                duration: appStack.animationDuration
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "x"
                easing.type: appStack.easingType
                from: -appStack.width
                to: 0
                duration: appStack.animationDuration
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "x"
                easing.type: appStack.easingType
                from: 0
                to: appStack.width
                duration: appStack.animationDuration
            }
        }
    }

    function nextModule() {
        moduleLoader.nextModule();
    }
}