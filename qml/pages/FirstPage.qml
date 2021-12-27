import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.animatorPush(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width - 2 * r.x
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Сurrency converter")
            }
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Rubles")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                id: r
                x: Theme.horizontalPageMargin
                validator: DoubleValidator {bottom: 0.00; decimals: 4}
            }
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Dollars")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                id: d
                readOnly: true
                x: Theme.horizontalPageMargin
            }
            Button {
                id: b
                x: parent.width / 2 - b.width / 2
                text: "Convert"
                onClicked: d.text = (r.text / rate).toFixed(2)
            }
        }
    }
}
