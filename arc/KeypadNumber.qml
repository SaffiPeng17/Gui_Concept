import QtQuick 2.0

Image{
    id: keypad_number
    source: "img/background.png"

    property string title_text: ""

    signal onOKClicked()

    function gerEntry() { return entry_text.text }

    function setEntry(text) { entry_text.text = text }

    function insert_type(number)
    {
        var tmpstr = entry_text.text.split('')
        var cursor = entry_text.cursorPosition

        tmpstr.splice(cursor, 0, number)
        entry_text.text = tmpstr.join('')
        entry_text.cursorPosition += 1
    }

    function delete_type()
    {
        var tmpstr = entry_text.text.split('')
        var cursor = entry_text.cursorPosition

        if(cursor > 0)
        {
            tmpstr.splice(cursor-1, 1)
            entry_text.text = tmpstr.join('')
            entry_text.cursorPosition -= 1
        }
    }

    Column{
        id: input_line
        width: parent.width*0.75
        spacing: 8
        anchors.top: parent.top; anchors.topMargin: 15
        anchors.left: parent.left; anchors.leftMargin: 5

        Text{
            text: title_text
            color: "black"
            font.pixelSize: 22
        }

        Row{
            spacing: 20

            Image{
                id: inputBar
                source: "img/input_bar.png"

                TextInput{
                    id: entry_text
                    width: parent.width*0.95
                    text: ""
                    font.pixelSize: 22
                    maximumLength: 15  //Max text length of entry
                    activeFocusOnPress: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Button{
                img_normal: "img/keypad_ok_normal.png"
                img_press:  "img/keypad_ok_press.png"
                anchors.verticalCenter: inputBar.verticalCenter
                onClicked: onOKClicked()
            }
        }
    }

    Rectangle{
        width: keypad_19.width
        height: keypad_19.height+keypad_0d.height+keypad_19.spacing
        color: "transparent"
        anchors.top: input_line.bottom; anchors.topMargin: 20
        anchors.left: parent.left; anchors.leftMargin: 5

        Grid{
            id: keypad_19
            rows: 3; columns: 3; spacing: 5

            Button{
                img_normal: "img/number_1.png"
                img_press:  "img/number_release.png"
                onClicked: insert_type("1")
            }
            Button{
                img_normal: "img/number_2.png"
                img_press:  "img/number_release.png"
                onClicked: insert_type("2")
            }
            Button{
                img_normal: "img/number_3.png"
                img_press:  "img/number_release.png"
                onClicked: insert_type("3")
            }
            Button{
                img_normal: "img/number_4.png"
                img_press:  "img/number_release.png"
                onClicked: insert_type("4")
            }
            Button{
                img_normal: "img/number_5.png"
                img_press:  "img/number_release.png"
                onClicked: insert_type("5")
            }
            Button{
                img_normal: "img/number_6.png"
                img_press:  "img/number_release.png"
                onClicked: insert_type("6")
            }
            Button{
                img_normal: "img/number_7.png"
                img_press:  "img/number_release.png"
                onClicked: insert_type("7")
            }
            Button{
                img_normal: "img/number_8.png"
                img_press:  "img/number_release.png"
                onClicked: insert_type("8")
            }
            Button{
                img_normal: "img/number_9.png"
                img_press:  "img/number_release.png"
                onClicked: insert_type("9")
            }
        } //Grid END
        Row{
            id: keypad_0d
            spacing: 5
            anchors.top: keypad_19.bottom; anchors.topMargin: 5

            Button{
                img_normal: "Image/number_0.png"
                img_press:  "Image/number_release.png"
                onClicked: insert_type("0")
            }
            Button{
                img_normal: "Image/sign_delete.png"
                img_press:  "Image/number_release.png"
                onClicked: delete_type()
            }
        }
    }
}
