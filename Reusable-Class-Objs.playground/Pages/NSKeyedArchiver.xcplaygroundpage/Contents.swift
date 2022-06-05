//: [Previous](@previous)

import Foundation

/*********************************************************
 
 Add to Model object ie book class
 
 *********************************************************/

// make class conform to protocol
// declare properties 
// add teh two methods required by the protocol
//    serialization
// decode: bytes back to object
// encode: object to bytes

/// NSCoding Protocol
class Book: NSObject, NSCoding {
  
  var text = ""

  required init?(coder aDecoder: NSCoder) {
    text = aDecoder.decodeObjectForKey("Text") as! String
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(text, forKey: "Text")
  }

// **************************************************

/// get file path to filePath.plist
  func documentsDirectory() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    return paths[0]
  }
  
  func dataFilePath() -> String {
    return (documentsDirectory() as NSString).stringByAppendingPathComponent("filePath.plist")
}

// **************************************************

/// save and load 
  func saveBooks() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
    archiver.encodeObject(____, forKey: "____")
    archiver.finishEncoding()
    data.writeToFile(dataFilePath(), atomically: true)
  }
  
  func loadBooks() {
    let path = dataFilePath()
    if NSFileManager.defaultManager().fileExistsAtPath(path) {
      if let data = NSData(contentsOfFile: path) {
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
        ____ = unarchiver.decodeObjectForKey("____") as! [____]
        unarchiver.finishDecoding()
        sortBookTitles()
      }
    }
}



/*********************************************************
 
 Serialization - object to bytes and vice versa 
 Objects in memory can't be directly saved or moved to other programs. They contain data, such as pointers, which are only valid in the context of your process's memory space. Move the contents of an object into another program and all of those pointers suddenly make no sense. Serialization is the process of converting the non-portable, in-memory representation of an object into a portable stream of bytes that can be stored and moved between processes.
 
 
 Archiving is split into two pieces. One piece is the actual archiver and unarchiver classes. These are NSKeyedArchiver and NSKeyedUnarchiver (and their non-keyed equivalents). They handle the nuts and bolts of translating a bunch of objects into a bunch of bytes.
 
 The other piece is the NSCoding protocol. This is code that you implement in order to tell the archiver how to encode and decode instances of your class.
 *********************************************************/