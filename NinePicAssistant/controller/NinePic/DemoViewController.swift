//
//  DemoViewController.swift
//  NinePicAssistant
//
//  Created by 何锦坤 on 2018/11/8.
//  Copyright © 2018年 何锦坤. All rights reserved.
//

import UIKit

class DemoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }

}

//MARK: - UI Init
extension DemoViewController {
    
    func initUI() {
        let backBtn = UIButton.init(type: .custom)
        backBtn.addTarget(self, action: #selector(NinePicViewController.backAction), for: UIControl.Event.touchUpInside)
        backBtn.setImage(UIImage.init(named: "back"), for: UIControl.State.normal)
        self.view.addSubview(backBtn)
        backBtn.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.topMargin.equalTo(self.view.snp.top).offset(40 + (isiPhoneXAbove ? 10 : 0))
            make.leftMargin.equalTo(self.view.snp.left).offset(20)
        })
        
        let contentView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENW, height: SCREENW))
        contentView.center = self.view.center
        self.view.addSubview(contentView)
        
        for index in 0..<9 {
            let str = NSString.init(format: "%d", index%3)
//            NSString.init(format: "", index%3)
            let i : CGFloat = CGFloat.init(str.intValue)
            let str1 = NSString.init(format: "%d", index/3)
            let j : CGFloat = CGFloat.init(str1.intValue)
            let imageView = UIImageView.init(image: UIImage.init(named: "1"))
            imageView.contentMode = UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            contentView.addSubview(imageView)
            imageView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            imageView.layer.borderWidth = 0.5
            imageView.snp.makeConstraints { (make) in
                make.width.equalTo(contentView.width/3)
                make.height.equalTo(contentView.width/3)
                make.centerX.equalTo(contentView.centerX/3+contentView.width/3*i)
                make.centerY.equalTo(contentView.width/6+contentView.width/3*j)
            }
            imageView.isUserInteractionEnabled = true
            let btn = UIButton.init(frame: imageView.frame)
            btn.tag = index
            btn.addTarget(self, action: #selector(click(btn:)), for: UIControl.Event.touchUpInside)
            imageView.addSubview(btn)
        }
        
        
    }
    
}

//MARK: - ClickEvent
extension DemoViewController{
    @objc func backAction() {
        self.dismiss(animated: true) {
            
        }
    }
    
    @objc func click(btn:UIButton){
        let vc = ShowViewController.init(image: UIImage.init(named: "1")!)
        self.present(vc, animated: true) {
            
        }
    }
}
