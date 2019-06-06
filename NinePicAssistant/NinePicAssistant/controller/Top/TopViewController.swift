//
//  TopViewController.swift
//  九图助手
//
//  Created by 何锦坤 on 2018/10/8.
//  Copyright © 2018年 何锦坤. All rights reserved.
//

import UIKit
import SnapKit

class TopViewController: BaseViewController {

    var collectionView : UICollectionView?
    let imageArray = ["nineP","library","setting","share"]
    let textArray = ["NINE-P","DEMO","SETTING","SHARE"]
    let idenContentString = "idenContentString"
    let headIdenString = "headIdenString"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = true
        self.initData()
        self.setUI()
    }
}

//MARK: - initData
extension TopViewController{
    func initData(){
        
    }
}

//MARK: - initUI
extension TopViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func setUI() -> Void {
        
        //  设置 layOut
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical  //滚动方向
        layout.itemSize = CGSize.init(width: SCREENW/2 - 20, height: SCREENW/2 - 20)
        // 设置CollectionView
        collectionView = UICollectionView(frame: CGRect.init(x: 20, y: 0, width: SCREENW-40, height: SCREENH), collectionViewLayout: layout) as UICollectionView?
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.layoutMargins = UIEdgeInsets.init(top: 5, left: 0, bottom: 5, right: 0)
        collectionView?.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: idenContentString)
        
        self.view.addSubview(collectionView!)
        collectionView?.snp.makeConstraints({ (make) in
            make.center.equalTo(self.view)
            make.height.equalTo(SCREENW - 30)
            make.width.equalTo(SCREENW-20)
        })
        
        let line1 = UIImageView.init()
        line1.image = UIImage.init(named: "verticalLine")
        self.view.addSubview(line1)
        line1.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.center.x)
            make.top.equalTo((collectionView?.snp.top)!).offset(20)
            make.width.equalTo(1)
            make.height.equalTo(SCREENW/2 - 40)
        }
        
        let line2 = UIImageView.init()
        line2.image = UIImage.init(named: "verticalLine")
        self.view.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.center.x)
            make.top.equalTo((collectionView?.snp.top)!).offset((SCREENW/2+10))
            make.width.equalTo(1)
            make.height.equalTo(SCREENW/2 - 40)
        }
        
        let line3 = UIImageView.init()
        line3.image = UIImage.init(named: "horizontalLine")
        self.view.addSubview(line3)
        line3.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view.center.y)
            make.left.equalTo((collectionView?.snp.left)!).offset(10)
            make.width.equalTo(SCREENW/2 - 40)
            make.height.equalTo(1)
        }
        
        let line4 = UIImageView.init()
        line4.image = UIImage.init(named: "horizontalLine")
        self.view.addSubview(line4)
        line4.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view.center.y)
            make.left.equalTo((collectionView?.snp.left)!).offset(SCREENW/2+10)
            make.width.equalTo(SCREENW/2 - 40)
            make.height.equalTo(1)
        }
        
        let titleLabel = UILabel.init()
        self.view.addSubview(titleLabel)
        let attText = NSMutableAttributedString.init(string: "Welcome\nTo PNine")
        attText.addAttributes( [NSAttributedString.Key.foregroundColor : KJColorHX(rgbValue: 0xa3a4a6, malpha: 1),NSAttributedString.Key.font : UIFont.init(name: "PingFangSC-Thin", size: 40) ?? UIFont.systemFont(ofSize: 30)], range: NSRange.init(location: 0, length: 7))
        attText.addAttributes( [NSAttributedString.Key.foregroundColor : KJColorHX(rgbValue: 0xffffff, malpha: 1),NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30)], range: NSRange.init(location: 8, length: 8))
        titleLabel.attributedText = attText
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.center.x)
            make.bottom.equalTo((collectionView?.snp.top)!).offset(-20)
            make.width.equalTo(SCREENW-20)
            make.height.equalTo(100)
        }
        
        let addBtn = UIButton.init(type: UIButton.ButtonType.custom)
        addBtn.setImage(UIImage.init(named: "camera"), for: UIControl.State.normal)
        view.addSubview(addBtn)
        addBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.center.x)
            make.bottom.equalTo(view.snp.bottom).offset(-20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        
    }
    
    //MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func  collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: idenContentString, for: indexPath) as! TopCollectionViewCell
        cell.myLabel.text = textArray[indexPath.row]
        // 获取随机颜色
        cell.myImageView.image = UIImage.init(named: imageArray[indexPath.row])
        
        return cell;
        
    }
    //MARK:UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap ==\(indexPath.row)")
        switch indexPath.row {
        case 0:
            let vc = NinePicViewController()
            self.present(vc, animated: true) {
                
            }
            break;
        case 1:
            let vc = DemoViewController()
            self.present(vc, animated: true) {
                
            }
            break;
        default:
            break;
        }
    }
    
    //MARK:UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
}
