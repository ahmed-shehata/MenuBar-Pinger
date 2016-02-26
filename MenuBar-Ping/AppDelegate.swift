//
//  AppDelegate.swift
//  MenuBar-Ping
//
//  Created by Ahmed Shehata on 2/26/16.
//  Copyright © 2016 Bitmonkey Games. All rights reserved.
//

import Cocoa
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var window: NSWindow!
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    var startTime: NSTimeInterval?;
    var currentTime: NSTimeInterval?;
    

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        self.pingOn("www.google.com");
        
        statusItem.title = "MP"
        statusItem.menu = statusMenu
//        formatter.minimumIntegerDigits = zeroPad ? 2 : 1
        
//        NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: "tick", userInfo: nil, repeats: true)

    }
    
    func pingOn(website: String)
    {
        startTime = NSDate.timeIntervalSinceReferenceDate()
        SimplePingHelper.ping(website, target: self, sel: "pingResult:");
    }
    
    func pingResult(success: Int) {
        
        var attributedString = NSMutableAttributedString(string: statusItem.title! as String)
        
        var firstAttributes = [NSForegroundColorAttributeName: NSColor.whiteColor()];
      
        let pingTime = Int((NSDate.timeIntervalSinceReferenceDate()-startTime!)*1000);
        statusItem.title = String(pingTime);
        var font = NSFont(name: "Arial", size: 14.0)
        if (pingTime>400)
        {
            
            firstAttributes = [NSForegroundColorAttributeName: NSColor.redColor()];
            
           
        }
        //firstAttributes.updateValue(NSColor.redColor(), forKey: NSFontAttributeName);
        
       
        let titleString = NSAttributedString(string: statusItem.title!, attributes: firstAttributes);

        statusItem.attributedTitle = titleString;
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
             self.pingOn("www.google.com");
        }
       
       
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func quitButtonTapped(sender: AnyObject) {
         NSApplication.sharedApplication().terminate(self);
    }

}

