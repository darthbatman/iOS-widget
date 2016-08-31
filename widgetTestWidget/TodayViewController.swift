//
//  TodayViewController.swift
//  widgetTestWidget
//
//  Created by Rishi Masand on 4/25/16.
//  Copyright © 2016 Rishi Masand. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
        
    @IBOutlet weak var testButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        self.preferredContentSize = CGSizeMake(0, 400);
    }
    
    override func viewDidLayoutSubviews() {
        if (userDefaults.stringForKey("color") != nil){
            if (userDefaults.stringForKey("color") == "blue"){
                testButton.backgroundColor = UIColor.blueColor()
            }
            else {
                testButton.backgroundColor = UIColor.redColor()
            }
        }
        else {
            userDefaults.setValue("red", forKey: "color")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    @IBAction func testPressed(sender: AnyObject) {
        if (testButton.backgroundColor == UIColor.blueColor()){
            testButton.backgroundColor = UIColor.redColor()
            userDefaults.setValue("red", forKey: "color")
        }
        else {
            testButton.backgroundColor = UIColor.blueColor()
            userDefaults.setValue("blue", forKey: "color")
        }
    }
    
}
