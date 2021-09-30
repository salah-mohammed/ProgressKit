# Result

![alt text](https://github.com/salah-mohammed/ProgressKit/blob/master/ProgressKitExample/example.png)

# ProgressKit


ProgressKit used for make threatment with Circle Progress  is more easy and more effient and there is alot of new properties that you can change it to Matches the design.
# Advantages
* You Can use Round Track and Square Track .
* You Can set prepared Angle Of Circle Progress and can choose your custom angle .


# How used (configuration): 
# Pod install
```ruby
pod 'ProgressKit',:git => "https://github.com/salah-mohammed/ProgressKit.git"
 
```
- First , add view in viewController in storyboard and make it inherets from CircleProgress


- Second , then add this code for change Circle Progress properties  .
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
- +972597105861 (whatsApp And PhoneNumber)

