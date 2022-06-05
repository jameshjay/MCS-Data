//
//  Foo.swift
//  NSKeyedArchiver
//

//

/*********************************************************
 
 Serialize/ Deserialize Data
 For ever class data type you want to persist, this must be added. 
 NSCoding protocol, class must be NSObject, along with it's 2 protocol methods
 
 *********************************************************/

import Foundation
import UIKit

class Foo: NSObject, NSCoding {
  
  var data = ""
  
  init(data: String) {
    self.data = data 
  }
  
  // serialize/ save
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(data, forKey:  "dataKey")
  }
  // needed to decode/ and decode
  required init?(coder aDecoder: NSCoder) {
    data = aDecoder.decodeObjectForKey("dataKey") as! String
  }
}

/*********************************************************
 
 include init(_) when you're creating a class data type to fill properties. 
 
 *********************************************************/
