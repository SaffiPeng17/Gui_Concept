# Gui classes implement & Sample
*There are many Gui pages in project usually. And some pages of them with the same page style. For example, Notification pages for notify user their commands are done. So make Notification page as a page type and create a class to define this page type. In order to reduce the same code that draws Notification page repeated continuously. There are attributes in Notification class like notify string, font size and maybe one button for leave Notification page. After define a Notification class, you can create a Notification page by using class and put  in notify string, define font size you want. And this sample is for expressing the basic idea above.*
<br>

## Class Define
###§ Button §
![Button](https://github.com/SaffiPeng17/gui_architecture/blob/master/arc/intro_img/cButton.png)
<br>

###Attributes intro.
__`img_normal: string`__ &#8194;Image file path for Button normal type.<br>
__`img_press: string`__ &#8194;Image file path for Button pressed type.<br>
__`btn_text: string`__ &#8194;Button Text displays on this Button.<br>
__`btn_fontSize: int`__ &#8194;Set font size for Button Text. Default font size is 30.<br>
__`btn_fontColor: color`__ &#8194;Set font color for Button Text. Default color is black.<br>
__`btn_enable: bool`__ &#8194;True is turn on Button event; False is turn off Button event. Default is true.
<br><br>

###§ PageTitle §
![Title](https://github.com/SaffiPeng17/gui_architecture/blob/master/arc/intro_img/cPageTitle.png)
<br>

###Attributes intro.
__`title_text: string`__ &#8194;Title Text displays on the top of page usually.
<br><br>

###§ TwoOptions §
![2 Options](https://github.com/SaffiPeng17/gui_architecture/blob/master/arc/intro_img/cOptions.png)
<br>

###Attributes intro.
__`title_text: string`__ &#8194;Title Text displays on the top of page.<br>
__`opt_1text: string`__ &#8194;Option Text for option 1.<br>
__`opt_2text: string`__ &#8194;Option Text for option 2.<br>
__`opt_fontSize: int`__ &#8194;Set font size for Option Text. Default font size is 30.
<br><br>

###§ Confirm §
![Cfm](https://github.com/SaffiPeng17/gui_architecture/blob/master/arc/intro_img/cConfirm.png)
<br>

###Attributes intro.
__`cfm_text: string`__ &#8194;Confirm Text displays on the page.<br>
__`cfm_fontSize: int`__ &#8194;Set font size for Confirm Text. Default font size is 30.<br>
__`cfm_fontColor: color`__ &#8194;Set font color for Confirm Text. Default color is black.
<br><br>

###§ Notification §
![Notify](https://github.com/SaffiPeng17/gui_architecture/blob/master/arc/intro_img/cNotify.png)
<br>

###Attributes intro.
__`notify_text: string`__ &#8194;Notify Text displays on the page.<br>
__`notify_fontSize: int`__ &#8194;Set font size for Notify Text. Default font size is 30.<br>
__`notify_fontColor: color`__ &#8194;Set font color for Notify Text. Default color is black.
<br><br>

###§ KeypadAlphabet §
![Keypad_alphabet](https://github.com/SaffiPeng17/gui_architecture/blob/master/arc/intro_img/cKeypad_alphabet.png)
<br>

###Attributes intro.
__`title_text: string`__ &#8194;Title Text is the purpose of input.
<br><br>

###§ KeypadAlphabet §
![Keypad_alphabet](https://github.com/SaffiPeng17/gui_architecture/blob/master/arc/intro_img/cKeypad_alphabet.png)
<br>

###Attributes intro.
__`title_text: string`__ &#8194;Title Text is directive for input.
<br><br>

###§ KeypadNumber §
![Keypad_number](https://github.com/SaffiPeng17/gui_architecture/blob/master/arc/intro_img/cKeypad_num.png)
<br>

###Attributes intro.
__`title_text: string`__ &#8194;Title Text is directive for input.
<br><br>

## Sample Flow
![Flow](https://github.com/SaffiPeng17/gui_architecture/blob/master/arc/intro_img/flow.png)
