# accgyr

This project tries to identify different movements using accelerometer and/or gyroscope in mobile phone.

In all testing cases phone was in one fixed position; screen up, top of phone always in direction of movement.

Several different movements were recorded (so far):

* Walking forward
* Moving on chair forward
* Sit on a chair and stand up
* Walking up/down stairs

## Progress

### Noise reduction
Recorded data seems very noisy, therefore we tried to get rid of noise by using *rolling  mean.*

Blue line represents movements Z-axis from *moving on chair forward* experiment.
Because there was only simple move forward we would expect that there is not going to be any change. However, it is hard to say what is going on only from the plot below.

<img src="http://i.imgur.com/wpRdqNu.png?1" />

After *rolling mean* was applied we can see that there are no big changes between measurements. Also, value about 9 m/s^2 seems right.

<img src="http://i.imgur.com/WpR7sED.png?1" />

### Visualization of movements
Red, green and blue colors in plots correspond to acceleration in X, Y and Z axis.

Sit on a chair and stand up

<img src="http://i.imgur.com/DWxI8fV.png?1" />

Walking up stairs

<img src="http://i.imgur.com/vy9GIxK.png?1" />

Walking down stairs

<img src="http://i.imgur.com/2mdu1J9.png?1" />

Moving on chair forward

<img src="http://i.imgur.com/dWd1T6H.png?1" />
