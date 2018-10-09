//
//  TopViewController.swift
//  九图助手
//
//  Created by 何锦坤 on 2018/10/8.
//  Copyright © 2018年 何锦坤. All rights reserved.
//

import UIKit
import SnapKit

class TopViewController: UIViewController {

    var collectionView : UICollectionView?
    let idenContentString = "idenContentString"
    let headIdenString = "headIdenString"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = true
        self.setUI()
    }
}

extension TopViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func setUI() -> Void {
        let bacView = UIImageView.init(frame: self.view.bounds)
        bacView.image = UIImage.init(named: "top-bac")
        self.view.addSubview(bacView)
        bacView.isUserInteractionEnabled = true
        
        //  设置 layOut
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical  //滚动方向
        layout.itemSize = CGSize.init(width: SCREENW/3 - 20, height: 150)
        // 设置CollectionView
        collectionView = UICollectionView(frame: CGRect.init(x: 5, y: 0, width: SCREENW-10, height: SCREENH), collectionViewLayout: layout) as UICollectionView?
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.layoutMargins = UIEdgeInsets.init(top: 20, left: 5, bottom: 20, right: 5)
        collectionView?.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: idenContentString)
        
        self.view.addSubview(collectionView!)
        collectionView?.snp.makeConstraints({ (make) in
            make.center.equalTo(self.view)
            make.height.equalTo(400)
            make.width.equalTo(SCREENW-20)
        })
    }
    
    //MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func  collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: idenContentString, for: indexPath) as! TopCollectionViewCell
        // 备注我们的小标题
        let indexString = String(indexPath.row)
        cell.myLabel.text = "我的小标题_" + indexString
        // 获取随机颜色
        cell.myImageView.backgroundColor = UIColor.randomColor
        
        return cell;
        
    }
    //MARK:UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap ==\(indexPath.row)")
        
    }
    
    //MARK:UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(20, 5, 20, 5)
    }
    
    
}
