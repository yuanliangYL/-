//
//  GrayView.swift
//  事件响应
//
//  Created by 袁亮 on 2018/2/26.
//  Copyright © 2018年 Albert Yuan. All rights reserved.
//


//每个能执行hitTest:方法的view都属于事件传递的一部分，但是，只有pointInside返回YES的view才属于响应者链条。
//响应者:继承UIResponder的对象称之为响应者对象，能够处理touchesBegan等触摸事件。
//响应者链条:由很多响应者链接在一起组合起来的一个链条称之为响应者链条.
//响应者链条其实还包括视图控制器、UIWindow和UIApplication，上述例子并没有表现出来。
//通过事件传递找到最合适的处理触摸事件的view后（就是最后一个pointInside返回YES的view，它是第一响应者），如果该view是控制器view，那么上一个响应者就是控制器。如果它不是控制器view，那么上一个响应者就是前面一个pointInside返回YES的view（其实就是它的父控件）。 最后这些所有pointInside返回YES的view加上它们的控制器、UIWindow和UIApplication共同构成响应者链条。

//响应者链条是自上而下的（我把window上最外面的那个view称为上），前面的事件传递是自下而上的。

import UIKit

class GrayView: UIView {

    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        print("click GrayView")
        
        /*1.判断自己可不可以与用户交互满足一下几点
         1.self.userInteractionEnabled = YES 可以与用户交互
         2.self.hidden = NO 不是隐藏的
         3.self.alpha > 0.01 透明度大于 0.01 也就是用户可见
         */
        //下面是写的上面的反面
        if self.isUserInteractionEnabled == false || self.isHidden == true || self.alpha <= 0.01 {
            return nil
        }
        
        /*2.这里查看这个点是不是在控件的bound上了,如果不在就返回nil */
        if self.point(inside: point, with: event) == false {
            return nil
        }
        
        /*3.遍历 子控件，由于addSubView 本身是把图层加到另 一个图层上面，导致图层的顺序是最后添加的在最上面,也就是 上面说的，后面加入的控件可能会在盖住，前面加入的控件图 层，而响应链是优先最上面的图层的，考虑到这个递归算法是 DFS 也就是深度优先，所以必须从后面的子控件遍历 */
        //3.1得到子控制总个数
        if self.subviews.count > 0 {
            for i in (0 ... (self.subviews.count - 1)).reversed() {
                //1.得到子控件
                let childView:UIView = self.subviews[i]
                //2,将父控件的坐标点转换到子控件中的形式,其实就拿 子控件在父控件的frame的x,y ,与用户触点的父控件的 x,y，进行减法*/
                let childPoint = self.convert(point, to: childView)
                //3.继续递归
                let firstView = childView.hitTest(childPoint, with: event)
                //4.发现不为空，就回传
                if let notEmpty = firstView {
                    return notEmpty
                }
            }
        }
        //5.如果没知道合适的处理事件控件，就返回自己
        return self
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         print("GrayView touchesBegan")
        
        super.touchesBegan(touches, with: event)
    }
    
//    hitTest:和pointInside:的使用：
    
    //1.屏蔽:如果将其pointInside返回值改为NO，则其hitTest方法直接返回空，这个屏幕上有色区域都不接收触摸事件。
    //想要屏蔽掉某个view响应点击事件，如果其没有子控件或者子控件响应事件也想屏蔽掉，直接将该view的pointInside返回为NO就行了。而在一般情况下，不建议将view的pointInside直接返回YES（影响范围太广，不好控制)
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        return false
//    }

    
    //2.穿透
    
}
