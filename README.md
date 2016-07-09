# accgyr

This project tries to identify different movements using accelerometer and/or gyroscope in mobile phone.

In all testing cases phone was in one fixed position -- screen up, top of phone always in direction of movement.

Several different movements were recorded:

* Walking forward
* Moving on chair forward
* Sit on a chair and stand up
* Walking on stairs up/down

## Progress
Recorded data seems very noisy, therefore we tried to get rid of noise by *rolling  mean.*

Blue line represents movements Z-axis from *moving on chair forward* experiment.
Because there was only simple move forward we would expect that there is not going to be any change. However, it is hard to say what is going on only from the plot below.

<img src="http://i.imgur.com/wpRdqNu.png?1" />

After *rolling mean* was applied we can see that there are now big changes between measurements. Also, value about 9 m/s^2 seems right.
<img src="http://i.imgur.com/WpR7sED.png?1" />
