import QtQuick 2.0

Image{
    id: confirm
    source: "img/background.png"

    property string cfm_text: ""
    property int    cfm_fontSize: 30
    property color  cfm_fontColor: "black"

    signal onselected(bool select)

    Text{
        width: parent.width*0.9
        height: parent.height-btn_row.height
        text: cfm_text
        color: cfm_fontColor
        font.pixelSize: cfm_fontSize
        wrapMode: Text.Wrap
        horizontalAlignment: "AlignHCenter"
        verticalAlignment: "AlignVCenter"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Row{
        id: btn_row
        spacing: parent.width-(yes.width*2)
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        Button{
            id: yes
            img_normal: "img/yes_normal.png"
            img_press:  "img/yes_press.png"
            anchors.bottom: parent.bottom
            onClicked: onselected(true)
        }
        Button{
            img_normal: "img/no_normal.png"
            img_press:  "img/no_press.png"
            anchors.bottom: parent.bottom
            onClicked: onselected(false)
        }
    }
}
