import QtQuick 2.0

Image{
    id: two_options
    source: "img/background.png"

    property string title_text: ""
    property string opt_1text: ""
    property string opt_2text: ""
    property int    opt_fontSize: 30

    property url img_select:   "img/option_select.png"
    property url img_deselect: "img/option_deselect.png"

    property int curSelected: 0   //Current Selected item

    signal onOKClicked(int curSelected)
    signal onCancelClicked()

    function select_item(value)
    {
        curSelected = value
        if(value == 1) //Select option_1
        {
            option_1.source = img_deselect
            option_2.source  = img_select
        }
        else if(value == 2) //Select option_2
        {
            option_1.source = img_select
            option_2.source  = img_deselect
        }
        else  //value = 0   //Select none
        {
            option_1.source = img_select
            option_2.source  = img_select
        }
    }

    PageTitle{
        id: title
        title_text: title_text
    }

    Rectangle{
        width: parent.width
        height: parent.height-title.height-cancel.height
        color: "transparent"
        anchors.top: title.bottom

        Column{
            width: option_1.width
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Row{
                width: parent.width
                spacing: 5

                Image{ id: option_1; source: img_select }
                Text{
                   height: parent.height
                   text: opt_1text
                   color: "black"
                   font.pixelSize: opt_fontSize
                   verticalAlignment: "AlignVCenter"
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed: select_item(1)
                }
            }
            Row{
                width: parent.width
                spacing: 5

                Image{ id: option_2; source: img_select }
                Text{
                   height: parent.height
                   text: opt_2text
                   color: "black"
                   font.pixelSize: opt_fontSize
                   verticalAlignment: "AlignVCenter"
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed: select_item(2)
                }
            }
        }
    }

    Row{
        spacing: 5
        anchors.top: parent.bottom

        Button{
            id: cancel
            img_normal: "img/cancel_normal.png"
            img_press:  "img/cancel_press.png"
            onClicked: onCancelClicked()
        }
        Button{
            img_normal: "img/ok_normal.png"
            img_press:  "img/ok_press.png"
            onClicked: onOKClicked(curSelected)
        }
    }
}
