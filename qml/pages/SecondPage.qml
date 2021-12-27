import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView
        model: rateModel
        anchors.fill: parent
        header: PageHeader {
            title: qsTr("Nested Page")
        }
        delegate: BackgroundItem {
            id: delegate

            Label {
                x: Theme.horizontalPageMargin
                text: valute + " " + rate
                anchors.verticalCenter: parent.verticalCenter
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            onClicked: {
                rate = rateModel.get(index).rate.replace(',', '.')
                caption = rateModel.get(index).valute
            }
        }
        VerticalScrollDecorator {}
    }
}
