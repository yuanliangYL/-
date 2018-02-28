//
//  ViewController.swift
//  事件响应
//
//  Created by 袁亮 on 2018/2/26.
//  Copyright © 2018年 Albert Yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // 判断设备是否越狱/***/
        //1.通过是否安装Cydia（适配度低）
        if FileManager.default.fileExists(atPath: "/Application/Cydia.app"){
            print("this device had jailbreaked")
        }else{
            print("this device had not jailbreaked")
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

