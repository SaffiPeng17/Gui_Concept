import QtQuick 2.6
import QtQuick.Window 2.2

Item{
    id: mainpage
    width: 800; height: 480

    Strings{ id: strs } //Define all strings on project

    TwoOptions{
        id: options

        property string selectItem: ""

        //Attributes
        title_text: strs.id_gender
        opt_1text: strs.id_male
        opt_2text: strs.id_female
        opt_fontSize: 28

        //Events
        onOKClicked: {
            console.log("Selected: "+curSelected)
            selectItem = curSelected
            mainpage.state = "State_cfm"
        }
        onCancelClicked: { console.log("Cancel modify.") }
    }

    Confirm{
        id: cfm

        //Attributes
        cfm_text: strs.id_sureselected + options.selectItem + "?"
        cfm_fontSize: 28

        //Events
        onselected: {
            console.log("Selected: "+select)
            if(select)
                mainpage.state = "State_notify"
            else
                mainpage.state = "State_options"
        }
    }
    Notification{
        id: notify

        //Attributes
        notify_text: options.selectItem + strs.id_isselected
        notify_fontSize: 28

        //Events
        onOKClicked: { mainpage.state = "State_options" }
    }


    KeypadAlphabet{ id: key_abc }
    KeypadNumber{ id: key_123 }

    //Define states for every page
    states: [
        State{
            name: "State_options"
            PropertyChanges{ target: options; opacity: 1 }
            PropertyChanges{ target: cfm;     opacity: 0 }
            PropertyChanges{ target: notify;  opacity: 0 }
        },
        State{
            name: "State_cfm"
            PropertyChanges{ target: options; opacity: 0 }
            PropertyChanges{ target: cfm;     opacity: 1 }
            PropertyChanges{ target: notify;  opacity: 0 }
        },
        State{
            name: "State_notify"
            PropertyChanges{ target: options; opacity: 0 }
            PropertyChanges{ target: cfm;     opacity: 0 }
            PropertyChanges{ target: notify;  opacity: 1 }
        }
    ]
}
