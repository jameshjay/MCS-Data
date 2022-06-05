//
//  ViewController.swift
//  NSKeyedArchiver
//

//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var dataTextField: UITextField!
  @IBOutlet weak var displayLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // save button will grab text,
  @IBAction func SaveButton(sender: AnyObject) {
    
    
    // hard code the object values
    // be sure to ! on the textfield. will return optional because may be nil. ! will be response or "empty".
    let car = Foo(data: "\(dataTextField.text!)")
    
    let data = NSMutableData()
    // created a keyed arhiver object with mutable data object so you can arhive
    let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
    // serialize the object  with keyed arhiver object
    archiver.encodeObject(car, forKey: "dataKey") //NSCoding protocol method called in Foo class.
    archiver.finishEncoding()
    data.writeToFile(dataFilePath(), atomically: true)
  }
  
  // note: NSKEYED is a subclass of NSCoder
  
  @IBAction func LoadButton(sender: AnyObject) {
    let path = dataFilePath()
    if NSFileManager.defaultManager().fileExistsAtPath(path) {
      if let data = NSData(contentsOfFile: path) {
        // create an unarhiver object to decode/deserialize.
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
        let test = unarchiver.decodeObjectForKey("dataKey") as! Foo
        displayLabel.text = test.data
        unarchiver.finishDecoding()
      }
    }
  }
  
  func documentsDirectory() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    return paths[0]
  }
  
  func dataFilePath() -> String {
    return (documentsDirectory() as NSString).stringByAppendingPathComponent("NSKeyedArchiver.plist")
  }

}

/*********************************************************
 
 NSCoding is not needed if you're just saving text/etc that's not in a separate class.
 
 
 *********************************************************/

