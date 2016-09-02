import QtQuick 2.0

Image{
    id: keypad_alphabet
    source: "img/background.png"

    property string title_text: ""

    property double tmrIn_SwitchText: 1000
    property double opacity_press: 0.7
    property double opacity_release: 1

    signal onOKClicked()
    signal onCancelClicked()

    function gerEntry() { return entry_text.text }

    function setEntry(text) { entry_text.text = text }

    function insert_type(typtxt)
    {
        var tmpstr = entry_text.text.split('')
        var cursor = entry_text.cursorPosition

        tmpstr.splice(cursor, 0, typtxt)
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

    function changeKeypad(type)
    {
        keypad_ABC.visible = false
        keypad_abc.visible = false
        keypad_123.visible = false

        if(type == "ABC")
            keypad_ABC.visible = true
        else if(type == "abc")
            keypad_abc.visible = true
        else  //type == "123"
            keypad_123.visible = true
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
                    maximumLength: 15  //Max text length of type_text
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
        width: keypad_19.width*0.95
        height: parent.height-input_line.height-20
        color: "transparent"
        anchors.top: input_line.bottom; anchors.topMargin: 20
        anchors.left: parent.left; anchors.leftMargin: 5

        Grid{
            id: keypad_ABC
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            rows: 3; columns: 6; spacing: 5

            Image{ //--1x1 Key: QW
                source: "img/alphabet_QW.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_QW.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "Q")? "W" : "Q"
                        }
                        else  //timer stop
                            parent.type_text = "Q"

                        insert_type(parent.type_text)
                        tmr_switch_QW.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_QW
                    interval: tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x2 Key: ER
                source: "img/alphabet_ER.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_ER.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "E")? "R" : "E"
                        }
                        else  //timer stop
                            parent.type_text = "E"

                        insert_type(parent.type_text)
                        tmr_switch_ER.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_ER
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x3 Key: TY
                source: "img/alphabet_TY.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_TY.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "T")? "Y" : "T"
                        }
                        else  //timer stop
                            parent.type_text = "T"

                        insert_type(parent.type_text)
                        tmr_switch_TY.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_TY
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x4 Key: UI
                source: "img/alphabet_UI.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_UI.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "U")? "I" : "U"
                        }
                        else  //timer stop
                            parent.type_text = "U"

                        insert_type(parent.type_text)
                        tmr_switch_UI.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_UI
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x5 Key: OP
                source: "img/alphabet_OP.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_OP.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "O")? "P" : "O"
                        }
                        else  //timer stop
                            parent.type_text = "O"

                        insert_type(parent.type_text)
                        tmr_switch_OP.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_OP
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x6 Key: Backspace
                source: "img/alphabet_Backspace.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        delete_type()
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--2x1 Key: AS
                source: "img/alphabet_AS.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_AS.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "A")? "S" : "A"
                        }
                        else  //timer stop
                            parent.type_text = "A"

                        insert_type(parent.type_text)
                        tmr_switch_AS.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_AS
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--2x2 Key: DF
                source: "img/alphabet_DF.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_DF.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "D")? "F" : "D"
                        }
                        else  //timer stop
                            parent.type_text = "D"

                        insert_type(parent.type_text)
                        tmr_switch_DF.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_DF
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }

            Image{ //--2x3 Key: GH
                source: "img/alphabet_GH.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_GH.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "G")? "H" : "G"
                        }
                        else  //timer stop
                            parent.type_text = "G"

                        insert_type(parent.type_text)
                        tmr_switch_GH.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_GH
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--2x4 Key: JK
                source: "img/alphabet_JK.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_JK.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "J")? "K" : "J"
                        }
                        else  //timer stop
                            parent.type_text = "J"

                        insert_type(parent.type_text)
                        tmr_switch_JK.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_JK
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--2x5 Key: LHyphen
                source: "img/alphabet_LHyphen.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_LHyphen.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "L")? "-" : "L"
                        }
                        else  //timer stop
                            parent.type_text = "L"

                        insert_type(parent.type_text)
                        tmr_switch_LHyphen.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_LHyphen
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--2x6 Key: Change Keypad
                source: "img/alphabet_ChangeKeypad.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: parent.opacity = opacity_press
                    onReleased: {
                        parent.opacity = opacity_release
                        changeKeypad("abc")
                    }
                }
            }
            Image{ //--3x1 Key: ZX
                source: "img/alphabet_ZX.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_ZX.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "Z")? "X" : "Z"
                        }
                        else  //timer stop
                            parent.type_text = "Z"

                        insert_type(parent.type_text)
                        tmr_switch_ZX.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_ZX
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x2 Key: CV
                source: "img/alphabet_CV.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_CV.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "C")? "V" : "C"
                        }
                        else  //timer stop
                            parent.type_text = "C"

                        insert_type(parent.type_text)
                        tmr_switch_CV.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_CV
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x3 Key: BN
                source: "img/alphabet_BN.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_BN.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "B")? "N" : "B"
                        }
                        else  //timer stop
                            parent.type_text = "B"

                        insert_type(parent.type_text)
                        tmr_switch_BN.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_BN
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x4 Key: MDoublequotes
                source: "img/alphabet_MDoublequotes.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_MDoublequotes.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "M")? "\"" : "M"
                        }
                        else  //timer stop
                            parent.type_text = "M"

                        insert_type(parent.type_text)
                        tmr_switch_MDoublequotes.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_MDoublequotes
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x5 Key: CommaSlash
                source: "img/alphabet_CommaSlash.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_CommaSlash.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == ",")? "/" : ","
                        }
                        else  //timer stop
                            parent.type_text = ","

                        insert_type(parent.type_text)
                        tmr_switch_CommaSlash.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_CommaSlash
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x6 Key: Space
                source: "img/alphabet_Space.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type(" ")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
        } //Grid END-Keypad ABC
        Grid{
            id: keypad_abc
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            rows: 3; columns: 6; spacing: 5

            Image{ //--1x1 Key: qw
                source: "img/alphabet_qw.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_qw.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "q")? "w" : "q"
                        }
                        else  //timer stop
                            parent.type_text = "q"

                        insert_type(parent.type_text)
                        tmr_switch_qw.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_qw
                    interval: tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x2 Key: er
                source: "img/alphabet_er.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_er.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "e")? "r" : "e"
                        }
                        else  //timer stop
                            parent.type_text = "e"

                        insert_type(parent.type_text)
                        tmr_switch_er.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_er
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x3 Key: ty
                source: "img/alphabet_ty.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_ty.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "t")? "y" : "t"
                        }
                        else  //timer stop
                            parent.type_text = "t"

                        insert_type(parent.type_text)
                        tmr_switch_ty.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_ty
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x4 Key: ui
                source: "img/alphabet_ui.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_ui.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "u")? "i" : "u"
                        }
                        else  //timer stop
                            parent.type_text = "u"

                        insert_type(parent.type_text)
                        tmr_switch_ui.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_ui
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x5 Key: op
                source: "img/alphabet_op.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_op.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "o")? "p" : "o"
                        }
                        else  //timer stop
                            parent.type_text = "o"

                        insert_type(parent.type_text)
                        tmr_switch_op.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_op
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x6 Key: Backspace
                source: "img/alphabet_Backspace.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        delete_type()
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--2x1 Key: as
                source: "img/alphabet_as.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_as.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "a")? "s" : "a"
                        }
                        else  //timer stop
                            parent.type_text = "a"

                        insert_type(parent.type_text)
                        tmr_switch_as.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_as
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--2x2 Key: df
                source: "img/alphabet_df.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_df.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "d")? "f" : "d"
                        }
                        else  //timer stop
                            parent.type_text = "d"

                        insert_type(parent.type_text)
                        tmr_switch_df.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_df
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }

            Image{ //--2x3 Key: gh
                source: "img/alphabet_gh.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_gh.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "g")? "h" : "g"
                        }
                        else  //timer stop
                            parent.type_text = "g"

                        insert_type(parent.type_text)
                        tmr_switch_gh.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_gh
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--2x4 Key: jk
                source: "img/alphabet_jk.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_jk.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "j")? "k" : "j"
                        }
                        else  //timer stop
                            parent.type_text = "j"

                        insert_type(parent.type_text)
                        tmr_switch_jk.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_jk
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--2x5 Key: lhyphen
                source: "img/alphabet_lhyphen.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_lhyphen.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "l")? "-" : "l"
                        }
                        else  //timer stop
                            parent.type_text = "l"

                        insert_type(parent.type_text)
                        tmr_switch_lhyphen.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_lhyphen
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--2x6 Key: Change Keypad
                source: "img/alphabet_ChangeKeypad.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: parent.opacity = opacity_press
                    onReleased: {
                        parent.opacity = opacity_release
                        changeKeypad("123")
                    }
                }
            }
            Image{ //--3x1 Key: zx
                source: "img/alphabet_zx.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_zx.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "z")? "x" : "z"
                        }
                        else  //timer stop
                            parent.type_text = "z"

                        insert_type(parent.type_text)
                        tmr_switch_zx.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_zx
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x2 Key: cv
                source: "img/alphabet_cv.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_cv.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "c")? "v" : "c"
                        }
                        else  //timer stop
                            parent.type_text = "c"

                        insert_type(parent.type_text)
                        tmr_switch_cv.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_cv
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x3 Key: bn
                source: "img/alphabet_bn.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_bn.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "b")? "n" : "b"
                        }
                        else  //timer stop
                            parent.type_text = "b"

                        insert_type(parent.type_text)
                        tmr_switch_bn.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_bn
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x4 Key: mapostrophe
                source: "img/alphabet_mapostrophe.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_mapostrophe.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "m")? "\'" : "m"
                        }
                        else  //timer stop
                            parent.type_text = "m"

                        insert_type(parent.type_text)
                        tmr_switch_mapostrophe.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_mapostrophe
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x5 Key: dotunderline
                source: "img/alphabet_dotunderline.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_dotunderline.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == ".")? "_" : "."
                        }
                        else  //timer stop
                            parent.type_text = "."

                        insert_type(parent.type_text)
                        tmr_switch_dotunderline.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_dotunderline
                    interval: tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x6 Key: Space
                source: "img/alphabet_Space.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type(" ")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
        } //Grid END-Keypad abc
        Grid{
            id: keypad_123
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            rows: 3; columns: 6; spacing: 5

            Image{ //--1x1 Key: 1
                source: "img/alphabet_1.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type("1")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--1x2 Key: 2
                source: "img/alphabet_2.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type("2")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--1x3 Key: 3
                source: "img/alphabet_3.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type("3")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--1x4 Key: 0
                source: "img/alphabet_0.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type("0")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--1x5 Key: Parentheses
                source: "img/alphabet_Parentheses.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_Parentheses.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "(")? ")" : "("
                        }
                        else  //timer stop
                            parent.type_text = "("

                        insert_type(parent.type_text)
                        tmr_switch_Parentheses.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_Parentheses
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--1x6 Key: Backspace
                source: "img/alphabet_Backspace.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        delete_type()
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--2x1 Key: 4
                source: "img/alphabet_4.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type("4")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--2x2 Key: 5
                source: "img/alphabet_5.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type("5")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--2x3 Key: 6
                source: "img/alphabet_6.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type("6")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--2x4 Key: HashtagAsterisk
                source: "img/alphabet_HashtagAsterisk.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_HashtagAsterisk.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "#")? "*" : "#"
                        }
                        else  //timer stop
                            parent.type_text = "#"

                        insert_type(parent.type_text)
                        tmr_switch_HashtagAsterisk.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_HashtagAsterisk
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--2x5 Key: AndAt
                source: "img/alphabet_AndAt.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_AndAt.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "&")? "@" : "&"
                        }
                        else  //timer stop
                            parent.type_text = "&"

                        insert_type(parent.type_text)
                        tmr_switch_AndAt.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_AndAt
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--2x6 Key: Change Keypad
                source: "img/alphabet_ChangeKeypad.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: parent.opacity = opacity_press
                    onReleased: {
                        parent.opacity = opacity_release
                        changeKeypad("ABC")
                    }
                }
            }
            Image{ //--3x1 Key: 7
                source: "img/alphabet_7.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type("7")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--3x2 Key: 8
                source: "img/alphabet_8.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type("8")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--3x3 Key: 9
                source: "img/alphabet_9.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type("9")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
            Image{ //--3x4 Key: DollarPlus
                source: "img/alphabet_DollarPlus.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_DollarPlus.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "$")? "+" : "$"
                        }
                        else  //timer stop
                            parent.type_text = "$"

                        insert_type(parent.type_text)
                        tmr_switch_DollarPlus.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_DollarPlus
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x5 Key: TildePercent
                source: "img/alphabet_TildePercent.png"
                property string type_text: ""

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press

                        if(tmr_switch_TildePercent.running)
                        {
                            delete_type()
                            parent.type_text = (parent.type_text == "~")? "%" : "~"
                        }
                        else  //timer stop
                            parent.type_text = "~"

                        insert_type(parent.type_text)
                        tmr_switch_TildePercent.restart()
                    }
                    onReleased: parent.opacity = opacity_release
                }
                Timer{
                    id: tmr_switch_TildePercent
                    interval:  tmrIn_SwitchText
                    running: false
                }
            }
            Image{ //--3x6 Key: Space
                source: "img/alphabet_Space.png"

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = opacity_press
                        insert_type(" ")
                    }
                    onReleased: parent.opacity = opacity_release
                }
            }
        }
    }
}
