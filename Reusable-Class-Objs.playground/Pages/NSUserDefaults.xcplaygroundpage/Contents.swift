//: [Previous](@previous)

import Foundation

// get NSUser object to get reference to users default app database
let defaults = NSUserDefaults.standardUserDefaults()
// shared same object (singletone, reference to same object) user default app database
let other = NSUserDefaults.standardUserDefaults()
print(defaults)
print(other)



// WRITE
defaults.setInteger(25, forKey: "Age")
other.setInteger(40, forKey: "Age")
// to set an array or dictionary
defaults.setObject("To_Save_Array/Dict", forKey: "Name")

// to remove
defaults.removeObjectForKey("SavedDict")

// READ
var value = defaults.integerForKey("Age")
print(value)



/*********************************************************
 Key-Value Store: NSUserDefaults stores Property List objects (NSString, NSData, NSNumber, NSDate, NSArray, and NSDictionary) identified by NSString keys, similar to an NSMutableDictionary.
 
 Optimized for storing user settings: NSUserDefaults is intended for relatively small amounts of data, queried very frequently, and modified occasionally. Using it in other ways may be slow or use more memory than solutions more suited to those uses.
 At runtime, you use an NSUserDefaults object to read the defaults that your application uses from a user’s defaults database. NSUserDefaults caches the information to avoid having to open the user’s defaults database each time you need a default value. The synchronize() method, which is automatically invoked at periodic intervals, keeps the in-memory cache in sync with a user’s defaults database.
 
 Note: Strings, Arrays, Dictionaries are structs, not objects (Value types) in Swift
 
 // to WRITE
 func setInteger(value: Int, forKey defaultName: String)
 func setURL(url: NSURL, forKey defaultName: String)
 func setDouble(value: Double, forKey defaultName: String)
 func setBool(value: Bool, forKey defaultName: String)
 func setObject(value: AnyObject?, forKey defaultName: String)
 func setFloat(value: Float, forKey defaultName: String)
 
 // to READ
 func integerForKey(defaultName: String) -> Int
 func boolForKey(defaultName: String) -> Bool
 func doubleForKey(defaultName: String) -> Double
 func floatForKey(defaultName: String) -> Float
 func stringForKey(defaultName: String) -> String?
 func URLForKey(defaultName: String) -> NSURL?
 func dataForKey(defaultName: String) -> NSData?
 func objectForKey(defaultName: String) -> AnyObject?
 func stringArrayForKey(defaultName: String) -> [AnyObject]?
 func arrayForKey(defaultName: String) -> [AnyObject]?
 func dictionaryForKey(defaultName: String) -> [NSObject : AnyObject]?
 
 // **************************************************
 
 Just to give you a heads up, objectForKey() will give you the most trouble because the result you get will be an optional object. Your options when using objectForKey() are either to Use as to typecast your object to the data type it should be. Use as! to force typecast your object to the data type it should be or use as? to optionally typecast your object to the type it should be. Note: the first two options are available from Xcode 6.3 or later.
 
 So, if you use as/as! and your objectForKey() returned the result: nil, your application will crash. You should only use these if you are absolutely certain what the return will be..
 
 The solution here is to use the nil coalescing operator which is written like: ??. This does two things at once: if the object on the left is optional and exists, it gets unwrapped into a non-optional value; if it does not exist, it uses the value on the right instead. This means we can use objectForKey() and as? to get an optional object, then use ?? to either unwrap the object or set a default value, all in one line.
 
 // **************************************************
 
 Why it doesnt work in playgrounds:
 
 NSUserDefaults is tied to the iOS sandbox environment. Playgrounds doesn't run in this environment. Hence why you won't be able to write files to disk. If you run this code in the application when running via the simulator or device, you'll have access to the sandbox environment and NSUserDefaults will return a proper reference.
 
 SANDBOX: app cant modify preferences of another app
 *********************************************************/