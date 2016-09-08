import QtQuick 2.0

Image{
    id: page_title
    source: "img/title.png"

    property string title_text: ""

    Text{
        text: title_text
        color: "black"
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}
