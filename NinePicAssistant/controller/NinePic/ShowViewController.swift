//
//  ShowViewController.swift
//  NinePicAssistant
//
//  Created by 何锦坤 on 2018/11/9.
//  Copyright © 2018年 何锦坤. All rights reserved.
//

import UIKit

class ShowViewController: BaseViewController {

    public var image:UIImage = UIImage()
    
    init(image:UIImage){
        super.init(nibName: nil, bundle: nil)
        self.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    func initView() {
        
        let scrollerView = UIScrollView.init(frame: self.view.frame)
        scrollerView.showsVerticalScrollIndicator = false
        self.view.addSubview(scrollerView)
        
        
        let imageHeight = self.image.size.height*self.view.width/self.image.size.width
        
        let imageView = UIImageView.init(image: self.image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        scrollerView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(SCREENW)
            make.height.equalTo(imageHeight)
            make.top.equalTo(scrollerView.snp.top)
        }
        scrollerView.contentSize = CGSize.init(width: SCREENW, height: imageHeight)
        
        let backBtn = UIButton.init(type: .custom)
        backBtn.addTarget(self, action: #selector(NinePicViewController.backAction), for: UIControl.Event.touchUpInside)
        backBtn.setImage(UIImage.init(named: "back"), for: UIControl.State.normal)
        self.view.addSubview(backBtn)
        let topMargin:Double = 40 + (isiPhoneXAbove ? 10 : 0)
        backBtn.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.topMargin.equalTo(self.view.snp.top).offset(topMargin)
            make.leftMargin.equalTo(self.view.snp.left).offset(20)
        })
        
    }
    
    @objc func backAction() {
        self.dismiss(animated: true) {
            
        }
    }
}
