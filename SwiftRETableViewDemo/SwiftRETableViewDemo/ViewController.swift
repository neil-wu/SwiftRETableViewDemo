//
//  ViewController.swift
//  SwiftRETableViewDemo
//
//  Created by neilwu on 11/10/15.
//  Copyright © 2015年 neilwu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, RETableViewManagerDelegate {
    
    
    var manager: RETableViewManager! = nil
    
    var oldPwdItem: RETextItem! = nil
    var newPwdItem: RETextItem! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.title = "modify password"
        
        self.manager = RETableViewManager(tableView: self.tableView)
        self.manager.delegate = self
        
        let section: RETableViewSection = RETableViewSection(headerTitle: "")
        self.manager.addSection(section)
        
        self.oldPwdItem = RETextItem(title: "Old password", value: nil, placeholder: "please input...")
        self.oldPwdItem.secureTextEntry = true
        section.addItem(oldPwdItem)
        
        
        self.newPwdItem = RETextItem(title: "New password", value: nil, placeholder: "please input...")
        self.newPwdItem.secureTextEntry = true
        section.addItem(newPwdItem)
        
        //mod btn
        let statusBarWidth = UIApplication.sharedApplication().statusBarFrame.width
        let footerBtn: UIButton = UIButton()
        footerBtn.setTitle("OK", forState: UIControlState.Normal)
        footerBtn.backgroundColor = UIColor.purpleColor()
        footerBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        footerBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        footerBtn.layer.cornerRadius = 4
        footerBtn.clipsToBounds = true
        footerBtn.frame = CGRectZero
        let tmpframe: CGRect = CGRectMake(12, 0, statusBarWidth - 24, 44)
        footerBtn.frame = tmpframe
        
        let footerView: UIView = UIView(frame: CGRectZero)
        footerView.frame.size.width = statusBarWidth
        footerView.frame.size.height = 44 //adjust the space
        footerView.addSubview(footerBtn)
        self.tableView.tableFooterView = footerView
        
        footerBtn.addTarget(self, action: Selector("onTapModBtn:"), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func onTapModBtn(obj: AnyObject) {
        print("tap")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

