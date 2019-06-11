# Tilda

Tilda Johnson (NightShade) is an extraordinary genius, and extensively self-taught in genetics, biochemistry, cybernetics, robotics and physics. She also obtained a doctoral degree from an undisclosed university while in prison.

![onSite](/onSite.jpg)

Tilda is a sequencing timeline that contains clips of various types. Tilda organizes these clips only in time. The vertical position of a clip on the timeline is used only for visual organization. Currently, there is no such concept as a track in tilda.

However, clips can be named and categorized individually.

The Tilda core node only evaluates time and only holds the clip data. It takes care of loading and saving a timeline (and potentially things like network sync). So you can think of tilda as a database of clips. What you do with the data in the clips is up to the user.

So the actual evaluation of the clips is performed in their respective getter nodes. The getter nodes filter the timeline for clips of certain names, categories and types and compute the clip values based on time. With the getter nodes that are provided with this release, you can choose whether you want the output of the getters as one unified value for all matching clips, or as a spread, one for each clip.

The renderer node is only needed for display and editing.

The core functionality of tilda is sequencing, so the default clip type is a 'control clip', providing nothing but a name, time, fade values and a variable, so you can build your desired functionality somwhere downstream in the patch.

Other clip types are built on top of these control clips. Currently there are audio, video, envelope and keyframe clips.

Refer to the help patches to see how to work with the getter nodes.

## using tilda

Navigating the timeline should be self explanatory. 

Right click and drag in the canvas to pan. Scroll wheel to zoom.

Drag in the time scale at the top to set the time.

## time
* Spacebar - play, pause
* Hold shift to snap to clips and full seconds
* Arrow keys 1 frame left & right (+control = 1 second) 

* Use an external clock to synchronize the timeline to external sources. If the clock pin is "0", tilda increments internally based on the FPS pin rate.

* Clips in the category 'Stop' make tilda stop, if it reaches the first frame of such a clip while playing.
* Clips in the 'Forward' category make the time jump to their end, if it reaches such a clip while playing.

Nodes like TimeController, goToClip and SetTC are used to set the time computationally

## editing Clips

Double click to create a new clip.

The default clip type is control clip. All functionality of the control clip is at the same time also the IClip interface of clips, so all other clip types implement also the functionality of control clips.
You can create other clip types by holdig a letter while double clicking. Hold
* A for a new audio clip
* E for a new envelope clip
* F for a new keyframe clip
* V for a new video clip.

Selct clips left click or selection rect.
(ToDo: Add to / remove from selection with shift-click)

* Ctrl C + V for copy and paste at CTI Position.
* Ctrl Z + Y for undo / redo.

### Trimming

Clips have handles to trim their start and end, fade in and out and source in point and duration values.

you can edit multiple clips at a time if you have many selected and trim one of them.

Otions:
Hold shift to snap to snapping points.
Hold control to hold the source media time in place, so to trim Start and In together (or out / duration only).
Hold alt to trim and keep the fading points in place.


### the inspector

Right click on a clip to open the inspector.

To create a new category type a new name in the category field. Colors will be assigned autmaticaly.

* StartFrame is the start Position on the tilda timeline.
* Duration is the duration on tilda timeline.
* FadeIn and FadeOut is the duration of the fade ramps at sart and end of a clip.
* InPoint is the first frame in the source media.
* SourceDuration is the length of the available source media.

It is on purpose that the changes made in the inspector are written to the clip immediately, so you can see the effect of the value change immediately without opening / cloing the inspector each time.


### envelope clips

Envelope clips hold a spline that evaluates to one float value for each given time. The reference space for these values is -1 to 1 and needs to be mapped outside of tilda to the desired value range.

Middle click on an envelope clip to go to the editing mode for envelope clips.

Once in the editing mode, you can't edit clips on the timeline anymore, but only keyframes inside the envelope clips.

Editing keyframes is based on the VL.EditingFramework:
Doublick to create a new Keyframe on the nearest point of the spline.
Select a Keyframe and press 1,2,3 to change the keyframe type (corner, asymmetrical, symmetrical).

If you edit the spline it will be automatically sanitized to create a create no overlaps, so it can always be evaluated properly.
Select Multiple keyframes to move them together on their pivot.

Middle click into the canvas to end editing the spline.
Middle click on another clip to edit that clips spline.


### keyframe clips

Keyframe clips can hold any size of spread in each keyframe. Currently, values can be written to Keyframes only through specific nodes, so there isn't a GUI workflow to edit the values in the keyframes yet. Refer to the helppatch to see how to edit the keyframe clip.

The handles of the keyframe clip are input and output velocity for the interpolation. So you are not editing the values themselves, but you define only the lerp value between two keyframes. Thus also the inclining ramp between keyframes. Think of designing the input morph value: 0 is the first input (so previous keyframe) and 1 is the second input (so next keyframe).

### audio clips
Audio clips hold a path to an audio file and render the waveform for it.

### video clips
Video Clips hold a path to a directory of an image sequence.
Specify a file pattern.
Specify a framerate of the source media.


## License
Tilda is released under the MIT license.

NAudio is used to render the Waveform.

The image stack player for vvvv which is included in the Tilda demo patches, is not part of Tilda and is subject to a commercial licence model.


