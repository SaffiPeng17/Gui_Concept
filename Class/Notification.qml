import QtQuick 2.0

Image{
    id: notification
    source: "img/background.png"

    property string notify_text: ""
    property int    notify_fontSize: 30
    property color  notify_fontColor: "black"

    signal onOKClicked()

    Text{
        width: parent.width*0.9
        height: parent.height-ok.height
        text: notify_text
        color: notify_fontColor
        font.pixelSize: notify_fontSize
        wrapMode: Text.Wrap
        horizontalAlignment: "AlignHCenter"
        verticalAlignment: "AlignVCenter"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button{
        id: ok
        img_normal: "img/ok_normal.png"
        img_press:  "img/ok_press.png"
        anchors.bottom: parent.bottom
        onClicked: onOKClicked()
    }
}
