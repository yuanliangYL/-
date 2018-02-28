//
//  YellowView.swift
//  事件响应
//
//  Created by 袁亮 on 2018/2/26.
//  Copyright © 2018年 Albert Yuan. All rights reserved.
//

import UIKit

class YellowView: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        print("click YellowView")
        
        if self.isUserInteractionEnabled == false || self.isHidden == true || self.alpha <= 0.01 {
            return nil
        }
    
        if self.point(inside: point, with: event) == false {
            return nil
        }
        if self.subviews.count > 0 {
            for i in (0 ... (self.subviews.count - 1)).reversed() {
                
                let childView:UIView = self.subviews[i]
                
                let childPoint = self.convert(point, to: childView)
                
                let firstView = childView.hitTest(childPoint, with: event)
                
                if let notEmpty = firstView {
                    return notEmpty
                }
            }
        }
        
        //改变上下逻辑顺序，可以实现超出父视图的子视图响应事件，//点击超出黄色区域的白色区域，点击事件由whiteView自己处理
//        if self.point(inside: point, with: event) == false {
//            return nil
//        }
        
        return self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("YellowView touchesBegan")
        super.touchesBegan(touches, with: event)
    }
    
    
    //不建议直接返回true
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        return true
//    }
}
