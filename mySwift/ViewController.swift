//
//  ViewController.swift
//  mySwift
//
//  Created by Sailinghj on 15-1-9.
//  Copyright (c) 2015年 Sailinghj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate  {
    @IBOutlet var myWebView: UIWebView!

    @IBOutlet weak var refrsh: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ECharts"
        self.myWebView.loadRequest(NSURLRequest(
            URL: NSURL(
                fileURLWithPath: NSBundle.mainBundle().pathForResource("echarts-m-modular", ofType: "html"
                )!
            )
        ))
        self.myWebView.delegate = self
        self.myWebView.scalesPageToFit = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        var array0 = [Int]()
        var array1 = [Int]()
        
        for _ in 1...6  {
            array0.append(randomInRange(-6...6))
            array1.append(randomInRange(-6...6))
        }
        
        let string = "window.setChart(\(array0),\(array1));"
        webView.stringByEvaluatingJavaScriptFromString(string)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.URL?.absoluteString
        let urlComps:[String] = (url?.componentsSeparatedByString(","))!
        
        if (urlComps.count > 0) && (urlComps[0].containsString("objc") == true)    {
            print("参数1:\(urlComps[1])  参数2:\(urlComps[2])")
            let alert = UIAlertController.init(title: "点击了图表!", message: "参数1:\(urlComps[1])  参数2:\(urlComps[2])", preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
            return false
        }   else    {
            return true
        }
    }
    
    @IBAction func reset(sender: AnyObject) {
        self.myWebView.reload()
    }
    
    
    func randomInRange(range: Range<Int>) -> Int {
        let count = UInt32(range.endIndex - range.startIndex)
        return  Int(arc4random_uniform(count)) + range.startIndex
    }
}

