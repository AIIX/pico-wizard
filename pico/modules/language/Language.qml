import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15

import org.kde.kirigami 2.7 as Kirigami

import PicoWizard 1.0

Module {
    id: root
    moduleName: languageModule.moduleName()
    moduleIcon: languageModule.dir() + "/assets/language.svg"
    moduleIconColor: "#ff999999"

    delegate: Item {
        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter

            ComboBox {
                Layout.preferredWidth: root.width * 0.4
                Layout.preferredHeight: 64
                model: LanguageModel {}
                textRole: "name"
            }
        }

        NextButton {
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 16
            }
        }
    }

    LanguageModule {
        id: languageModule
    }
}
