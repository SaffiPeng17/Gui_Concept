import QtQuick 2.6
import QtQuick.Window 2.2

Item{
    id: main
    width: 800; height: 480

    Strings{ id: strs } //Define all strings on project

    Image{
        id: page1
        source: "img/background.png"

        Column{
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text{ //---Title
                text: strs.id_sample
                font.pixelSize: 28
            }
            Button{ //---Options
                img_normal: "img/btn_blank_normal.png"
                img_press:  "img/btn_blank_press.png"
                btn_text: strs.id_options
                btn_fontSize: 28
                onClicked: main.state = "State_options"
            }
            Button{ //---Keypad abc
                img_normal: "img/btn_blank_normal.png"
                img_press:  "img/btn_blank_press.png"
                btn_text: strs.id_keypadalphabet
                btn_fontSize: 28
                onClicked: main.state = "State_keypad_abc"
            }
            Button{ //---Keypad 123
                img_normal: "img/btn_blank_normal.png"
                img_press:  "img/btn_blank_press.png"
                btn_text: strs.id_keypadnumber
                btn_fontSize: 28
                onClicked: main.state = "State_keypad_123"
            }
            Text{ //---Result
                id: result
                text: strs.id_resulthere
                font.pixelSize: 28
            }
        }
    }

    TwoOptions{
        id: options
        opacity: 0

        property string selectItem: ""

        //Attributes
        title_text: strs.id_gender
        opt_1text: strs.id_male
        opt_2text: strs.id_female
        opt_fontSize: 28

        //Events
        onOKClicked: {
            selectItem = curSelected
            main.state = "State_cfm"
        }
        onCancelClicked: {
            result.text = strs.id_canceloptions
            main.state = "State_page1"
        }
    }

    Confirm{
        id: cfm
        opacity: 0

        //Attributes
        cfm_text: strs.id_sureselected + options.selectItem + "?"
        cfm_fontSize: 28

        //Events
        onselected: {
            if(select)
                main.state = "State_notify"
            else
                main.state = "State_options"
        }
    }

    Notification{
        id: notify
        opacity: 0

        //Attributes
        notify_text: options.selectItem + strs.id_isselected
        notify_fontSize: 28

        //Events
        onOKClicked: {
            result.text = strs.id_selectgender + options.selectItem
            main.state = "State_page1"
        }
    }

    KeypadAlphabet{
        id: key_abc
        opacity: 0

        //Attributes
        title_text: strs.id_entryid

        //Events
        onOKClicked: {
            result.text = strs.id_entryid + typetext
            main.state = "State_page1"
        }
    }

    KeypadNumber{
        id: key_123
        opacity: 0

        //Attributes
        title_text: strs.id_entrypassword

        //Events
        onOKClicked: {
            result.text = strs.id_entrypassword + typetext
            main.state = "State_page1"
        }
    }

    //Define states for every page
    states: [
        State{
            name: "State_page1"
            PropertyChanges{ target: page1;   opacity: 1 }
            PropertyChanges{ target: options; opacity: 0 }
            PropertyChanges{ target: cfm;     opacity: 0 }
            PropertyChanges{ target: notify;  opacity: 0 }
            PropertyChanges{ target: key_abc; opacity: 0 }
            PropertyChanges{ target: key_123; opacity: 0 }
        },
        State{
            name: "State_options"
            PropertyChanges{ target: page1;   opacity: 0 }
            PropertyChanges{ target: options; opacity: 1 }
            PropertyChanges{ target: cfm;     opacity: 0 }
            PropertyChanges{ target: notify;  opacity: 0 }
            PropertyChanges{ target: key_abc; opacity: 0 }
            PropertyChanges{ target: key_123; opacity: 0 }
        },
        State{
            name: "State_cfm"
            PropertyChanges{ target: page1;   opacity: 0 }
            PropertyChanges{ target: options; opacity: 0 }
            PropertyChanges{ target: cfm;     opacity: 1 }
            PropertyChanges{ target: notify;  opacity: 0 }
            PropertyChanges{ target: key_abc; opacity: 0 }
            PropertyChanges{ target: key_123; opacity: 0 }
        },
        State{
            name: "State_notify"
            PropertyChanges{ target: page1;   opacity: 0 }
            PropertyChanges{ target: options; opacity: 0 }
            PropertyChanges{ target: cfm;     opacity: 0 }
            PropertyChanges{ target: notify;  opacity: 1 }
            PropertyChanges{ target: key_abc; opacity: 0 }
            PropertyChanges{ target: key_123; opacity: 0 }
        },
        State{
            name: "State_keypad_abc"
            PropertyChanges{ target: page1;   opacity: 0 }
            PropertyChanges{ target: options; opacity: 0 }
            PropertyChanges{ target: cfm;     opacity: 0 }
            PropertyChanges{ target: notify;  opacity: 0 }
            PropertyChanges{ target: key_abc; opacity: 1 }
            PropertyChanges{ target: key_123; opacity: 0 }
        },
        State{
            name: "State_keypad_123"
            PropertyChanges{ target: page1;   opacity: 0 }
            PropertyChanges{ target: options; opacity: 0 }
            PropertyChanges{ target: cfm;     opacity: 0 }
            PropertyChanges{ target: notify;  opacity: 0 }
            PropertyChanges{ target: key_abc; opacity: 0 }
            PropertyChanges{ target: key_123; opacity: 1 }
        }
    ]
}
