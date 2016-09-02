import QtQuick 2.0

Image{
    id: normal_button
    source: img_normal

    property string img_normal: ""
    property string img_press: ""
    property string btn_text: ""
    property int    btn_fontSize: 30
    property string btn_fontColor: "black"
    property bool   btn_enable: true

    signal onClicked()

    Text{
        width: button.width*0.9
        text: btn_text
        color: btn_fontColor
        font.pixelSize: btn_fontSize
        horizontalAlignment: "AlignHCenter"
        wrapMode: Text.Wrap
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    MouseArea{
        anchors.fill: parent
        enabled: btn_enable
        onPressed: {
            button.source = img_press
            timer_hold.running = true
        }
    }

    Timer{
        id: tmr_hold
        interval: 100
        running: false
        onTriggered: {
            parent.source = img_normal
            onClicked()
        }
    }
}
