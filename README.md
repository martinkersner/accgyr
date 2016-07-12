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

Blue line represents movements in Z-axis from *moving on chair forward* experiment.
Because there was only simple move forward we would expect that there is not going to be any change. However, it is hard to say what is going on only from the plot below.

<img src="http://i.imgur.com/wpRdqNu.png?1" />

After *rolling mean* was applied we can see that there are no big changes between measurements. Also, value about 9 m/s^2 seems right.

<img src="http://i.imgur.com/WpR7sED.png?1" />

### Visualization of movements
Red, green and blue colors in plots correspond to acceleration in X, Y and Z-axis.

Plots were created with [exploreData.R](https://github.com/martinkersner/accgyr/blob/master/exploreData.R).

#### Sit on a chair and stand up

<img src="http://i.imgur.com/DWxI8fV.png?1" />

#### Walking up stairs

<img src="http://i.imgur.com/vy9GIxK.png?1" />

#### Walking down stairs

<img src="http://i.imgur.com/2mdu1J9.png?1" />

#### Moving on chair forward

<img src="http://i.imgur.com/dWd1T6H.png?1" />

### Classify movements in 1D
Following table shows comparisons of different movements in Z-axis using *dynamic time warping*. For this experiment, full lengths of signals were used. In further experiments we should use shorter templates (mainly for case when walking up/down stairs) in order to be able to detect step on/from even single stair.

In table you can see that the same movements have smaller values (smaller number means more similar signals) than movements that differ. In all cases values of corresponding movements are at least more than 40 % smaller than values of non-corresponding ones. To distinguish between them we will have to set a threshold.

Setting a threshold at the right place will be also challenging, however with enough data decision should be easier.

Values displayed in this table were computed using [compare1DSignals.R](https://github.com/martinkersner/accgyr/blob/master/compare1DSignals.R).

<table style="border-collapse:collapse;border-spacing:0"><tr><th style="font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></th><th style="font-family:Arial, sans-serif;font-size:14px;font-weight:bold;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">sitandup1</th><th style="font-family:Arial,
sans-serif;font-size:14px;font-weight:bold;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">sitandup2</th><th style="font-family:Arial, sans-serif;font-size:14px;font-weight:bold;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">stairsup1</th><th style="font-family:Arial, sans-serif;font-size:14px;font-weight:bold;padding:10px
5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">stairsup2</th><th style="font-family:Arial, sans-serif;font-size:14px;font-weight:bold;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">stairsdown1</th><th style="font-family:Arial, sans-serif;font-size:14px;font-weight:bold;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">stairsdown2</th><th style="font-family:Arial,
sans-serif;font-size:14px;font-weight:bold;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">chairforward1</th><th style="font-family:Arial, sans-serif;font-size:14px;font-weight:bold;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">chairforward2</th></tr><tr><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px
5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;font-weight:bold">sitandup1</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;background-color:#32cb00">8.0753</td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">118.2528</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">120.2707</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">99.28724</td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">103.2684</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">89.24358</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">74.56808</td></tr><tr><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;font-weight:bold">sitandup2</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">103.5235</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">103.5919</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">90.56968</td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">97.71866</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">73.21654</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">60.06544</td></tr><tr><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;font-weight:bold">stairsup1</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;background-color:#32cb00">22.3262</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">43.40362</td><td
style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">57.6417</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">94.87552</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px
5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">92.64532</td></tr><tr><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;font-weight:bold">stairsup2</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">41.79768</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">50.15024</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">92.70426</td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">92.04128</td></tr><tr><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;font-weight:bold">stairsdown1</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td
style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;background-color:#32cb00">19.84814</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">65.6716</td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">66.04926</td></tr><tr><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;font-weight:bold">stairsdown2</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td
style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">84.38554</td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal">84.448</td></tr><tr><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;font-weight:bold">chairforward1</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td
style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial,
sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;background-color:#32cb00">16.95338</td></tr><tr><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;font-weight:bold">chairforward2</td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px
5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px
5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px
5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td><td style="font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal"></td></tr></table>

### Classify movements in 1D with short time signals
The longer template signal we would use, the longer it would take to compute DTW.
Simple solution could be to create short-time templates.
However, it means we have to compute DTW more often.
It all boils down to how precise we want to be, eg. do we have to able detect even just one step on stairs?
[compare1DSignals_part2.R](https://github.com/martinkersner/accgyr/blob/master/compare1DSignals_part2.R) enables to experiment with short time signal templates in 1D (Z-axis).
The main focus was put on determining whether person is going up or down on stairs. 
~~Currently we are not able to distinguish between them using short time 1D signal template.~~
Adding one more dimension (Y-axis) could help because it captures speed of forward movement (it should differ in our observations).

<img src="http://i.imgur.com/JD6HMCD.png?1" />

After examining data more thoroughly it turned out that we could be able to distinguish between movements only using 1D short time signal template.
However, additional dimension would be still beneficial for increasing classification confidence.
In following plot you can see comparison statistics of *stairs up 1* movement with others.
Again, the lower values mean higher similarity.
Two green lines denote the worst false positive and false negative medians.
The space between them contains almost one fifth (the more the better) on scale of all comparisons with *stairs up 1* movement.

<img src="http://i.imgur.com/gIh5ZTb.png?1" />

### Exploring Y-axis
[Y-axis](https://developer.android.com/guide/topics/sensors/sensors_overview.html#sensors-coords) denotes forward movement.
Both graphs were generated by [exploreData_part2.R](https://github.com/martinkersner/accgyr/blob/master/exploreData_part2.R).

Following graph depicts movement patterns for walking stairs up or down.
In plots that are denoting walking stairs up you can see that after each step on stair acceleration diminishes.
When walking from stairs down there is no distinct regular pattern, but speed is slightly higher.
Red lines in plot express minimum and maximum values, while green line denotes median value.

<img src="http://i.imgur.com/xaSU4q5.png?1" />

Previous graph contains patterns that could be recognized, however, values on Y-axis could be also used for determination of an average speed (if we expect that walking up is slower than walking down from stairs)
Slope of red line in plot denotes average speed (walking down was faster).
If we would decide to use this computation of an average speed we would have to also incorporate sliding window to reduce error which accumulates along with time.

<img src="http://i.imgur.com/xqZ5N7z.png?1" />

### Generating templates from recorded data
New data (10 for each case) were captured while walking stairs up and down.
This data should be used for generating templates and then employed with dynamic time warping.
Each template should look like a single wave, describing one step on stairs.
Each signal was divided to equidistant non-overlapping parts for which we then computed crosscorrelation with one manually selected wave.
After that we shifted signal in order to achieve the maximum correlation.
All (if they achieved at least minimum determined correlation) shifted signals were then averaged to create final template.
For wave expressing walking up we were able to obtain template that quite nicely summarize all signal waves, however we are not sure if this generalization is not too big.
In case of walking stairs down we came accros problem that is related to quite different dynamics between steps, therefore the way how we generate template now is not good enough.
Allowing overlap between parts of signal could help to obtain better results.

On the following graph you can see signal wave from walking stairs up. The higher plot expresses base signal which was used to compute correlation with all other waves.
The plot below is generated template.

<img src="http://i.imgur.com/jRABee3.png?1" />
