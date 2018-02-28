//
//  GreenView.swift
//  事件响应
//
//  Created by 袁亮 on 2018/2/26.
//  Copyright © 2018年 Albert Yuan. All rights reserved.
//

import UIKit

class GreenView: UIView {
    
    //强制关联
    @IBOutlet weak var WhiteView: WhiteView!
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        print("click GreenView")
        
        //点击超出父视图部分的白色，绿色不响应，白色响应
        let p = self.convert(point, to: WhiteView)
        if WhiteView.point(inside: p, with: event) {
            return WhiteView
        }
        return super.hitTest(point, with: event)
        
        
        
//        if self.isUserInteractionEnabled == false || self.isHidden == true || self.alpha <= 0.01 {
//            return nil
//        }
//
//        if self.point(inside: point, with: event) == false {
//            return nil
//        }
//
//        if self.subviews.count > 0 {
//            for i in (0 ... (self.subviews.count - 1)).reversed() {
//
//                let childView:UIView = self.subviews[i]
//
//                let childPoint = self.convert(point, to: childView)
//
//                let firstView = childView.hitTest(childPoint, with: event)
//
//                if let notEmpty = firstView {
//                    return notEmpty
//                }
//            }
//        }
//
//        return self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("GreenView touchesBegan")
        super.touchesBegan(touches, with: event)
    }
    
   
}
