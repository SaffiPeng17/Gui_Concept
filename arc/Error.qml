import QtQuick 2.0

Image{
    id: error
    source: "img/background.png"

    property string err_text: ""
    property color  err_fontColor: "Red"
    property int    err_fontSize: 30

    signal onOKClicked()

    Rectangle{
        width: parent.width*0.9
        height: parent.height-ok.height
        anchors.horizontalCenter: parent.horizontalCenter

        Text{
            id: text
            text: err_text
            color: err_fontColor
            font.pixelSize: err_fontSize
            wrapMode: Text.Wrap
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        Image{
            source: "img/exclamation.png"
            anchors.right: text.left; anchors.rightMargin: 9
            anchors.verticalCenter: text.verticalCenter
        }
    }

    Button{
        id: ok
        img_normal: "img/ok_normal.png"
        img_press:  "img/ok_press.png"
        anchors.bottom: parent.bottom
        onClicked: onOKClicked()
    }
}
