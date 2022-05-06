# SwiftJSON

[![CI Status](https://img.shields.io/travis/zhaoxin/SwiftJSON.svg?style=flat)](https://travis-ci.org/zhaoxin/SwiftJSON)
[![Version](https://img.shields.io/cocoapods/v/SwiftJSON.svg?style=flat)](https://cocoapods.org/pods/SwiftJSON)
[![License](https://img.shields.io/cocoapods/l/SwiftJSON.svg?style=flat)](https://cocoapods.org/pods/SwiftJSON)
[![Platform](https://img.shields.io/cocoapods/p/SwiftJSON.svg?style=flat)](https://cocoapods.org/pods/SwiftJSON)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftJSON is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftJSON'
```
and you can easily user it as:
```Swift
let jsonstr = """
{
"result": 1.23,
"dog": {
    "name": "dog dog",
    "aa": {
        "a": 123,
        "b": "ccc",
        "arr": [11,22,33]
    }
}
}
"""

let json = JSONObject.make(jsonstr)
print(json)
print(json["dog"]["aa"]["arr"][1].stringValue)
print(json["result"].stringValue)

```

## Author

dlleng, 2190931560@qq.com

## License

SwiftJSON is available under the MIT license. See the LICENSE file for more info.
