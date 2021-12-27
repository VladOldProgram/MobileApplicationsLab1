import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import QtQuick.XmlListModel 2.0

ApplicationWindow {
    initialPage: Component { FirstPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations

    property XmlListModel rateModel: XmlListModel {
        id: xmlModel
        source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "/ValCurs/Valute"
        XmlRole {name: "valute"; query: "CharCode/string()"}
        XmlRole {name: "rate"; query: "Value/string()"}
    }
    property string caption: "USD"
    property real rate: 75
}
