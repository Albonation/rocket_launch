# rocket_launch

Critical Thinking Questions:

1. At zero the color status was red. Pressing the button made the color status
yellow and it stayed yellow until seven. Moving the slider changed the color status
once the counter reached 50, where it changed to green. Pressing decrement changed
the color status back to yellow.
2. When pressing the decrement button while the counter is at zero, a conditional
either decrements counter or sets counter to zero and setState() is just 
rebuilding the UI with what counter is set to. The increment button increments the counter by one, unless it reaches 100

3. My app switches to "LIFTOFF!" when the counter reaches 100. I did this by using
a widget to display the counter and color status, and conditionally displaying the
text "LIFTOFF!" if the counter is 100.
