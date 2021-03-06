//
//  HTPageView.swift
//  HTPageViewExample
//
//  Created by 魏小庄 on 2017/11/22.
//  Copyright © 2017年 魏小庄. All rights reserved.
//

import UIKit

class HTPageView: UIView {

    fileprivate var titles: [String]
    fileprivate var childVcs : [UIViewController]
    fileprivate var parentVc : UIViewController
    fileprivate var titleStyle : HTTitleStyle
    fileprivate var titleView : HTTitleView!
    
    init(frame: CGRect, titles:[String], childVcs: [UIViewController], parentVc: UIViewController, titleStyle: HTTitleStyle) {
        self.titles = titles
        self.childVcs = childVcs
        self.parentVc = parentVc
        self.titleStyle = titleStyle
        super.init(frame: frame)
         setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HTPageView{
    // 设置UI
    fileprivate func setUpUI(){
       setTopTitleView()
       setContentView()
    }
    
    fileprivate func setTopTitleView(){
        
        titleView = HTTitleView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: titleStyle.titleViewHeight), titles: titles, style: titleStyle)
        titleView.backgroundColor = UIColor.randomColor()
        addSubview(titleView)
    }
    
    fileprivate func setContentView(){
        
        let contentFrame = CGRect(x: 0, y: titleStyle.titleViewHeight, width: bounds.size.width, height: bounds.size.height - titleStyle.titleViewHeight)
        let contentView = HTContentView(frame: contentFrame, childVcs: childVcs, parentVc: parentVc)
        addSubview(contentView)
        
        titleView.delegate = contentView
        contentView.delegate = titleView
    }
    
}
