//
//  TopCollectionViewCell.swift
//  九图助手
//
//  Created by 何锦坤 on 2018/10/8.
//  Copyright © 2018年 何锦坤. All rights reserved.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.myLabel.frame = CGRect.init(x: 10, y: 60, width: frame.size.width - 20, height: 20)
        self.myImageView.frame = CGRect.init(x: 10, y: 0, width: frame.size.width - 20, height: 60)
        
        self.contentView .addSubview(self.myLabel)
        self.contentView .addSubview(self.myImageView)
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.shadowOpacity = 0.5
        self.contentView.layer.shadowRadius = 5
        self.contentView.layer.shadowOffset = CGSize.init(width: 3, height: 5)
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.shadowColor = KJColorHX(rgbValue: 0x666666, malpha: 1).cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var myLabel:UILabel = {
        let label = UILabel()
        label.text = "我的小标题"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    var myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                self.contentView.backgroundColor = KJColorHX(rgbValue: 0xf47fae, malpha: 1)
                self.contentView.layer.shadowColor = KJColorHX(rgbValue: 0xf47fae, malpha: 1).cgColor
            }else{
                self.contentView.backgroundColor = UIColor.white
                self.contentView.layer.shadowColor = KJColorHX(rgbValue: 0x666666, malpha: 1).cgColor
            }
        }
    }
    
    
}
