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
- Second

if you want set Navigation bar transparent and change title color .
```swift
class FirstViewController: UIViewController,NavigationDelegate {
 
    var navigationData:NavigationData=NavigationData.init(NavigationManager.NavigationStyle.custom(NavigationManager.BarColor.transparent,titleColor:UIColor.black))
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
 }

 ```
 
 if you want to set Navigation bar color and set title color for it.
 
 ```swift

  class SecondViewController: UIViewController,NavigationDelegate {
  
  var navigationData: NavigationData=NavigationData.init(NavigationManager.NavigationStyle.custom(NavigationManager.BarColor.customColor(UIColor.blue), titleColor:  UIColor.white))
    
        public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```
if you want to hide Navigation bar.

 ```swift
 class ThiredViewController: UIViewController,NavigationDelegate {

    var navigationData: NavigationData=NavigationData.init(NavigationManager.NavigationStyle.hide);
    
        public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
 ```

# Configure Successfully

## License

ProgressKit is released under the MIT license. [See LICENSE](https://github.com/salah-mohammed/ProgressKit/blob/master/LICENSE) for details.

# Developer's information to communicate

- salah.mohamed_1995@hotmail.com
- https://www.facebook.com/salah.shaker.7
