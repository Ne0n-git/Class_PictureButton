#Include lib\GDIp.ahk
#Include lib\Class_PictureButton_v1.ahk


;<----SUPER-GLOBAL VARIABLES---->
class PictureButton { ;BUG (or not) :0 -> super-global variable
}
;<------------------------------>
return
main() {
	static main:=main()
	PictureButton:=new _PictureButton()
	gui, +hwndhGui
	gui,show,w200 h50

	btn:=["resource\button-close-normal.png"
		   ,"resource\button-close-hover.png"
		   ,"resource\button-close-pressed.png"
		   ,"resource\button-close-disabled.png"]
	options:={h:31,state:"normal",btn:btn,on_click:func("clicked")}

	PictureButton.add(hGui,options,text)

	OnMessage(0x200, "WM_MOUSEMOVE")
	OnMessage(0x201, "WM_LBUTTONDOWN")
	OnMessage(0x202, "WM_LBUTTONUP")
	OnMessage(0x2A3, "WM_MOUSELEAVE")
	SetTimer, label,3000
	return 1
}

GuiClose:
ExitApp

label:
disabled:=!disabled
if(disabled)
	PictureButton.Disable(1)
else PictureButton.Enable(1)
return

f1::reload
clicked() {
	static i:=0
	i++
	ToolTip, % i, 40, 40
}






































;<--------------HOOKS----------------->

WM_MOUSEMOVE(wParam, lParam, Msg, Hwnd) {
	MouseGetPos,,,, hwnd, 2
	PictureButton.MOUSEMOVE(hwnd)
}
WM_MOUSELEAVE(wParam, lParam, Msg, Hwnd) {
	PictureButton.MOUSEMOVE(0)
}


WM_LBUTTONDOWN(wParam, lParam, Msg, Hwnd) {
	MouseGetPos,,,, hwnd, 2
	PictureButton.LBUTTONDOWN(hwnd)
}

WM_LBUTTONUP(wParam, lParam, Msg, Hwnd) {
	MouseGetPos,,,, hwnd, 2
	PictureButton.LBUTTONUP(hwnd)
}


TrackMouseEvent(ptr) {
	DllCall("TrackMouseEvent", "UInt", ptr)
}
;<--------------HOOKS----------------->










