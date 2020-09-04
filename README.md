# Result

![alt text](https://github.com/salah-mohammed/ProgressKit/blob/master/ProgressKitExample/example.png)

# ProgressKit


ProgressKit used for make threat with screen that have differents navigation bar style, make change style of bar easy.
# Advantages
* You Can use Round Track and Square Track .
* You Can set prepared Angle Of Circle Progress and can choose your custom angle .


# How used (configuration): 
# Pod install
```ruby
pod 'ProgressKit',:git => "https://github.com/salah-mohammed/ProgressKit.git"
 
```
- First

add view in viewController in storyboard and make it inherets from CircleProgress


- Second

if you want set Navigation bar transparent and change title color .
```swift

        self.viewCircleProgress.fullTrackColor=UIColor.lightGray
        self.viewCircleProgress.partialTrackColor = UIColor.red
        self.viewCircleProgress.fullTrackWidth=13
        self.viewCircleProgress.partialTrackWidth=13
        self.viewCircleProgress.angle = .full
        
        self.viewCircleProgress.fullTrackShapeLayerLineCap = .round
        self.viewCircleProgress.partialTrackShapeLayerLineCap = .round

        
        self.viewCircleProgress.durationValue=300
        self.viewCircleProgress.value=50 ?? 0

 ```
 

# Configure Successfully

## License

ProgressKit is released under the MIT license. [See LICENSE](https://github.com/salah-mohammed/ProgressKit/blob/master/LICENSE) for details.

# Developer's information to communicate

- salah.mohamed_1995@hotmail.com
- https://www.facebook.com/salah.shaker.7
