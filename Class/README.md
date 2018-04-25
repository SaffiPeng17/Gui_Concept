# Gui compoment implement & Sample

**Language: [QML](https://doc.qt.io/qt-5.10/qmlapplications.html)**

*There are many Gui pages in project usually. And some pages of them with the same page style. For example, Notification pages for notify user their commands are done. So make Notification page as a page type and create a class to define this page type. In order to reduce the same code that draws Notification page repeated continuously. There are attributes in Notification class like notify string, font size and maybe one button for leave Notification page. After define a Notification class, you can create a Notification page by using class and put  in notify string, define font size you want. And this sample is for expressing the basic idea above.*

<br>

## Button

![Button](https://github.com/SaffiPeng17/Gui_Concept/blob/master/Class/intro_img/cButton.png)

| Attribute | Data Type | Description |
|-----------|-----------|-------------|
| `img_normal` | string | Image filepath for normal style. |
| `img_press` | string | Image filepath for pressed style. |
| `btn_text` | string | Text displays on button. |
| `btn_fontSize` | int | The font size of Text. Default is 30. |
| `btn_fontColor` | color | The font color of Text. Default is black. |
| `btn_enable` | bool | Enable/Disable button. True is Enable, False is Disable. Default is true. |

<br>

## PageTitle

![Title](https://github.com/SaffiPeng17/Gui_Concept/blob/master/Class/intro_img/cPageTitle.png)

| Attribute | Data Type | Description |
|-----------|-----------|-------------|
| `title_text` | string | Title Text, displays on the top of page usually. |

<br>

## TwoOptions

![2 Options](https://github.com/SaffiPeng17/Gui_Concept/blob/master/Class/intro_img/cOptions.png)

| Attribute | Data Type | Description |
|-----------|-----------|-------------|
| `title_text` | string | Title Text displays on the top of page. |
| `opt_1text ` | string | Option Text for option 1. |
| `opt_2text ` | string | Option Text for option 2. |
| `opt_fontSize` | int | The font size of Text. Default is 30. |

<br>

## Confirm

![Cfm](https://github.com/SaffiPeng17/Gui_Concept/blob/master/Class/intro_img/cConfirm.png)

| Attribute | Data Type | Description |
|-----------|-----------|-------------|
| `cfm_text` | string | Text displays on confirm page. |
| `cfm_fontSize` | int | The font size of Text. Default is 30. |
| `cfm_fontColor` | color | The font color of Text. Default is black. |

<br>

## Notification

![Notify](https://github.com/SaffiPeng17/Gui_Concept/blob/master/Class/intro_img/cNotify.png)

| Attribute | Data Type | Description |
|-----------|-----------|-------------|
| `notify_text` | string | Text displays on Notification page. |
| `notify_fontSize` | int | The font size of Text. Default is 30. |
| `notify_fontColor` | color | The font color of Text. Default is black. |

<br>

## KeypadAlphabet

![Keypad_alphabet](https://github.com/SaffiPeng17/Gui_Concept/blob/master/Class/intro_img/cKeypad_alphabet.png)

| Attribute | Data Type | Description |
|-----------|-----------|-------------|
| `title_text` | string | Instruction text for entry. |

<br>

## KeypadNumber

![Keypad_number](https://github.com/SaffiPeng17/Gui_Concept/blob/master/Class/intro_img/cKeypad_num.png)

| Attribute | Data Type | Description |
|-----------|-----------|-------------|
| `title_text` | string | Instruction text for entry. |

<br>

## String List

_Collect all strings used in project. It's easier to find & modify strings. The String List also is considered to a Class._

#### ＊ How to use
1. Add string in String List Class and define an ID for it.

	```
	property string id_sample: qsTr("Sample : ")
	```

2. Define String List Class in main.

	```
	Strings{ id: strs }
	```

3. Subtitute string into Gui Item by String ID.

	```
	Text{ text: strs.id_sample }
	```

<br>

## Sample Flow

![Flow](https://github.com/SaffiPeng17/Gui_Concept/blob/master/Class/intro_img/flow.png)
