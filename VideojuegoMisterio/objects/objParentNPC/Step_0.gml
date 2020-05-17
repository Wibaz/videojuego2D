if (place_meeting(x,y,objPlayer)) {
	if (keyboard_check(vk_space)) {
		if(myTextBox == noone) {
			myTextBox = instance_create_layer(x,y,"Text", objTextBox);
			myTextBox.text = myText;
			myTextBox.creator = self;
			myTextBox.name = myName;
		}
	}
}
else {
	if(myTextBox != noone) {
		instance_destroy(myTextBox);
		myTextBox = noone;
	}
}
