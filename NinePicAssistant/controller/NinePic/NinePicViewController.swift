//
//  NinePicViewController.swift
//  NinePicAssistant
//
//  Created by 何锦坤 on 2018/10/8.
//  Copyright © 2018年 何锦坤. All rights reserved.
//

import UIKit
import SnapKit
import TLPhotoPicker
import Photos

class NinePicViewController: BaseViewController,TLPhotosPickerViewControllerDelegate {
    var selectedAssets = [TLPHAsset]()
    var image = UIImage()
    let imageView = UIImageView.init()
    var imageinfoList = [Dictionary<String, Any>]()
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = KJColor(255, g: 255, b: 255, a: 1)
        super.viewDidLoad()
        self.initView()
    }


}
extension NinePicViewController{
    
    func initView() {
        let backBtn = UIButton.init(type: .custom)
        backBtn.addTarget(self, action: #selector(NinePicViewController.backAction), for: UIControl.Event.touchUpInside)
        backBtn.setImage(UIImage.init(named: "back"), for: UIControl.State.normal)
        self.view.addSubview(backBtn)
        backBtn.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.topMargin.equalTo(self.view.snp.top).offset(40 + (isiPhoneXAbove ? 20 : 0))
            make.leftMargin.equalTo(self.view.snp.left).offset(20)
        })
        
        let addBtn = UIButton.init(type: .custom)
        addBtn.addTarget(self, action: #selector(NinePicViewController.addAction), for: UIControl.Event.touchUpInside)
        addBtn.setImage(UIImage.init(named: "add"), for: UIControl.State.normal)
        self.view.addSubview(addBtn)
        addBtn.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottomMargin.equalTo(self.view.snp.bottom).offset(-20)
        })
        
        
        imageView.image = self.image
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.center.equalTo(self.view.center)
        }
        
    }
    
}
extension NinePicViewController{
    
    @objc func backAction() {
        self.dismiss(animated: true) {
            
        }
    }
    
    @objc func addAction() {
        let viewController = TLPhotosPickerViewController()
        viewController.delegate = self
        var configure = TLPhotosPickerConfigure()
        configure.allowedVideo = false
        configure.singleSelectedMode = true
        viewController.configure = configure
        self.present(viewController, animated: true, completion: nil)
    }
    
    //TLPhotosPickerViewControllerDelegate
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        // use selected order, fullresolution image
        self.selectedAssets = withTLPHAssets
        for asset:TLPHAsset in self.selectedAssets {
            //收集所选图片信息
            if asset.fullResolutionImage != nil{
                let imageinfoDic = ["image":asset.fullResolutionImage!,"width":asset.fullResolutionImage!.size.width,"height":asset.fullResolutionImage!.size.height] as [String : Any]
                self.imageinfoList.append(imageinfoDic)
            }
        }
    }
    internal func dismissPhotoPicker(withPHAssets: [PHAsset]) {
        // if you want to used phasset.
    }
    func photoPickerDidCancel() {
        // cancel
    }
    func dismissComplete() {
        // picker viewcontroller dismiss completion
    }
    internal func canSelectAsset(phAsset: PHAsset) -> Bool {
        return true
    }
    func didExceedMaximumNumberOfSelection(picker: TLPhotosPickerViewController) {
        // exceed max selection
    }
    func handleNoAlbumPermissions(picker: TLPhotosPickerViewController) {
        // handle denied albums permissions case
    }
    func handleNoCameraPermissions(picker: TLPhotosPickerViewController) {
        // hand
    }
}
