//
//  TopCollectionViewCell.swift
//  九图助手
//
//  Created by 何锦坤 on 2018/10/8.
//  Copyright © 2018年 何锦坤. All rights reserved.
//

import UIKit
import SnapKit

class TopCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.myLabel.frame = CGRect.init(x: 10, y: 60, width: frame.size.width - 20, height: 20)
        self.myImageView.frame = CGRect.init(x: 10, y: 0, width: frame.size.width - 20, height: 60)
        
        self.contentView .addSubview(self.myLabel)
        self.contentView .addSubview(self.myImageView)
        self.myImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView.center.x)
            make.centerY.equalTo(self.contentView.center.y-10)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        self.myLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView.center.x)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
        //        self.contentView.layer.cornerRadius = 8
//        self.contentView.layer.masksToBounds = false
//        self.contentView.layer.shadowOpacity = 0.5
//        self.contentView.layer.shadowRadius = 5
//        self.contentView.layer.shadowOffset = CGSize.init(width: 3, height: 5)
        self.contentView.backgroundColor = UIColor.clear
//        self.contentView.layer.shadowColor = KJColorHX(rgbValue: 0x666666, malpha: 1).cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var myLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "PingFangSC-Thin", size: 16)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    var myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.clear
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                self.contentView.backgroundColor = KJColorHX(rgbValue: 0x000000, malpha: 1)
//                self.contentView.layer.shadowColor = KJColorHX(rgbValue: 0xf47fae, malpha: 1).cgColor
            }else{
                self.contentView.backgroundColor = UIColor.clear
//                self.contentView.layer.shadowColor = KJColorHX(rgbValue: 0x666666, malpha: 1).cgColor
            }
        }
    }
    
    
}
