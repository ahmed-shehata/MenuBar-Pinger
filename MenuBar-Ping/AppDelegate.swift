//
//  AppDelegate.swift
//  MenuBar-Ping
//
//  Created by Ahmed Shehata on 2/26/16.
//  Copyright © 2016 Bitmonkey Games. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
 
    var startTime: NSTimeInterval?;
    var currentTime: NSTimeInterval?;
    

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        startTime = NSDate.timeIntervalSinceReferenceDate()
        SimplePingHelper.ping("www.google.com", target: self, sel: "pingResult:");
    }
    
    func pingResult(success: Int) {
        
        
        print((NSDate.timeIntervalSinceReferenceDate()-startTime!)*1000);
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.startTime = NSDate.timeIntervalSinceReferenceDate()
            SimplePingHelper.ping("www.google.com", target: self, sel: "pingResult:");
        }
       
        print("SUCCESS")
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

