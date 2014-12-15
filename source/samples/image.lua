white = Color.new(255,255,255)
black = Color.new(0,0,0)
oldpad = Controls.read()
bitmap2 = Screen.loadBitmap("/file.bmp")
bitmap = Screen.createImage(1,1)
Screen.flipImage(bitmap2,bitmap)
Screen.fillRect(50,150,1,15,white,bitmap2)
Screen.debugPrint(51,3,"Image...OK!",black,bitmap2)
while true do
	Screen.waitVblankStart()
	Screen.refresh()
	Controls.init()
	pad = Controls.read()
	if (Controls.check(pad,KEY_A)) then
		System.exit()
	end
	if (Controls.check(pad,KEY_B)) and not (Controls.check(oldpad,KEY_B)) then
		Screen.saveBitmap(bitmap2,"/bitmap.bmp")
		System.takeScreenshot("/screenshot.bmp")
	end
	Screen.drawImage(100,127,bitmap2,TOP_SCREEN)
	Screen.drawImage(60,0,bitmap,BOTTOM_SCREEN)
	Screen.flip()
	oldpad = pad
end