//
//  ViewController.swift
//  Swift_02
//
//  Created by 陈孟迪 on 2017/11/23.
//  Copyright © 2017年 陈孟迪. All rights reserved.
//

import UIKit
var label : UILabel?
var number = 0
var timer : Timer?

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        
    }

    func createUI() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "重置", style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftAction))
        
        label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2))
        label?.text = String.init(format: "%d",number)
        label?.font = UIFont.systemFont(ofSize: 60)
        label?.textColor = UIColor.black
        label?.textAlignment = NSTextAlignment.center
        self.view.addSubview((label)!)
        
        let tapLabel : UILabel = UILabel.init(frame: CGRect.init(x: (self.view.frame.size.width - 100)/2, y: self.view.frame.size.height/2+10, width: 100, height: 100))
        tapLabel.text = "tap";
        tapLabel.isUserInteractionEnabled = true//不加这句话点击没反应
        tapLabel.backgroundColor = UIColor.orange
        tapLabel.textColor = UIColor.black
        tapLabel.textAlignment = NSTextAlignment.center
        tapLabel.layer.cornerRadius = 50
        tapLabel.layer.masksToBounds = true//必须得加这句话，不然圆角设置不成功
        
        self.view.addSubview(tapLabel)
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.tapAction(sender:)))
        tapLabel.addGestureRecognizer(tap)
        
        let long : UILongPressGestureRecognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(ViewController.longAction(sender:)))
        tapLabel.addGestureRecognizer(long)
        
    }

    @objc func leftAction() {
        
        number = 0
        label?.text = String.init(format: "%d",number)
    }
    @objc func action()  {
        number += 1
        label?.text = String.init(format: "%d",number)
    }
    @objc func longAction(sender : UILongPressGestureRecognizer) {
        
        switch sender.state {
        case .began:
            print("长按响应开始")
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        case .ended:
            print("长按响应结束")
            timer?.invalidate()
        case .changed:
            print("长按响应改变")
            
        default: break
            
        }
    }
    
    @objc func tapAction(sender : UITapGestureRecognizer) {
        number += 1
        label?.text = String.init(format: "%d",number)
        print(String.init(format: "%d", number))
    }
    
    
    
}

