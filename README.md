# iTrainer
H.I.I.T. workout iOS app. Leverages SwiftUI and modern Swift development practices. Utilizes SwiftUI components namely navigation stack and modal views for the UI, @State, @Binding, @Published, and @StateObject for state management as well as data persistence and concurrency, and queues to handle asynchronous tasks.

<p align="center">
  <img src="/demo/iTrainer_icon_rounded.png" alt="rejuvenate_icon" width="125" height="125"/>
</p>

### About iTrainer
iTrainer is a High-Intensity Interval Training (H.I.I.T.) workout app. With many people having begun habituating an at-home-work model and COVID-19 continuously making travelling to gyms a public health issue, staying active at home has become increasingly important. However, the majority of households do not possess gym equipment such as treadmills and weights. Thus, an effective alternative to this is employing H.I.I.T. workouts as they require little to no equipment and enable the practitioner to train cardio while simultaneously building muscle. iTrainer makes managing your H.I.I.T. workouts easier as a place to store all the different kinds of workouts you may want to use. iTrainer also has a built-in timer that will make a "ding" noise at the 40-second mark and 1-minute mark between each routine movement. This enables the user to know when to perform the exercise for 40 seconds and when to take a 20-second break without needing to play a H.I.I.T. workout video in the background. This way, the user can listen to the music of their choice during the session while still being notified when each interval has expired. 

### iOS Tech Stack
**Language**: Swift 5</br>
**Frameworks**: SwiftUI </br>
**IDE**: Xcode 13 </br>

## App Demo

### Launch and Home Screen
The home screen displays a list of all the user's exercise routines. 

![iTrainer Launch](/demo/1_intro.gif)

### Exercise Routine Detail View
By clicking an exercise routine row item, the user will be navigated to the exercise routine detail view. The detail view contains information such as the exercise routine's title, duration, theme, movements, and history of activity. 

![iTrainer Detail View](/demo/2_detail_view.gif)

### Start Exercise Routine by clicking `Start Exercise Routine` button
Within the exercise routine's detail view there contains a `Start Exercise Routine` button that will navigate the user to the exercise routine timer view. The timer will start automatically and start counting down. The timer view also displays the current routine movement to be completed.  

![iTrainer Start Timer](/demo/3_timer_start.gif)

#### Exercise Routine Timer View Progress Animations
After each exercise routine movement is completed the timer view will fill a segment of the routine ring with the theme colour to indicate the movement was completed. The central text will also update to display the new routine movement that is to be completed. 

Additionally, although not shown in the gif, the exercise timer will also produce a "ding" sound effect at every 40-second mark and 1-minute mark between each routine movement. This enables the user to know when to perform the exercise for 40 seconds and when to take a 20-second break without needing to play a H.I.I.T. workout video in the background. 

![iTrainer Timer View Animations](/demo/4_timer_scroll.gif)

### Add a new Exercise Routine
The following illustrates the process to add a new exercise routine to iTrainer

#### 1. Tap the `+` button in the top right corner 

![iTrainer Add New Routine](/demo/5_add_view.gif)

#### 2. Add a new title

![iTrainer Add New Title](/demo/6_add_title.gif)

#### 3. Pick a routine duration

![iTrainer Add New Time](/demo/7_add_time_slider.gif)

#### 4. Pick a theme color

![iTrainer Add New Theme](/demo/8_pick_theme.gif)

#### 5. Add routine movements 

![iTrainer Add New Movement](/demo/9_add_squats.gif)

#### 6. Tap the `Add` button in the top right corner to save

![iTrainer Add New Routine Save](/demo/10_save_new_movement.gif)

### Edit a Exercise Routine
By first navigating to the detail view and then clicking on the `Edit` button in the top right corner, properties such as the routine's  title, duration, theme, and movements can be modified. 

![iTrainer Edit View](/demo/11_edit_view.gif)

#### Add additional movements to the routine 
As an example, the edit view can be used to add a new movement to the exercise routine. This can be done by typing in the movement name and then tapping the `+` button. 

![iTrainer Edit Movements by Adding](/demo/12_add_lunges.gif)

#### Delete movements from the routine 
The edit view can also be used to delete movements from a routine by swiping the row item to the left. 

![iTrainer Edit Movements by Deleting](/demo/13_delete_squats.gif)

### iTrainer Light Mode
iTrainer has a fully operational dark mode and light mode. The app will automatically detect when the system enters dark/light mode and updates all views accordingly. To be concise, only the home screen's dark mode is demonstrated.

![iTrainer Light Mode](/demo/14_light_mode.gif)
