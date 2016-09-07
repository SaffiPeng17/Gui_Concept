import QtQuick 2.0

Image{
    id: select_button
    source: img_normal

    property string img_normal: ""
    property string img_press: ""
    property string btn_text: ""
    property int    btn_fontsize: 30
    property color  btn_fontcolor: "black"
    property bool   btn_enable: true

    property string pj_path: "file://project1/img/"

    signal onSelected()
    signal onDeselected()

    Text{
        width: button.width*0.9
        text: btn_text
        color: btn_fontcolor
        font.pixelSize: btn_fontsize
        horizontalAlignment: "AlignHCenter"
        wrapMode: Text.Wrap
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    MouseArea{
        anchors.fill: parent
        enabled: btn_enable
        onPressed: {
            if(parent.source == pj_path+img_normal)
            {
                parent.source = img_press
                onSelected()
            }
            else  //Pressed case
            {
                parent.source = img_normal
                onDeselected()
            }
        }
    }
}
