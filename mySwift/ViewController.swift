//
//  ViewController.swift
//  mySwift
//
//  Created by Sailinghj on 15-1-9.
//  Copyright (c) 2015年 Sailinghj. All rights reserved.
//

import UIKit

class ViewController: UIViewController   {
    @IBOutlet var myWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ECharts"
        self.myWebView.loadRequest(NSURLRequest(
            URL: NSURL(
                fileURLWithPath: NSBundle.mainBundle().pathForResource("echarts-m-plain", ofType: "html"
                )!
            )
        ))
        
        self.myWebView.scalesPageToFit = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

