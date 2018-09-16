//
//  UIViewController+NavigationController.swift
//  UITabber-demo
//
//  Created by S.Emoto on 2018/09/16.
//  Copyright © 2018年 Sho Emoto. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setBackButton() {
        let backButtonItem = UIBarButtonItem(title: "戻る",
                                             style: .plain,
                                             target: self,
                                             action: #selector(goBackLastVC))
        guard let frameVC = getFrameViewController() else { return }
        frameVC.navigationItem.leftBarButtonItem = backButtonItem
    }
    
    func getFrameViewController() -> UIViewController? {
        return self.navigationController?.viewControllers.first?.parent?.parent
    }
    
    @objc
    func goBackLastVC() {
        
        // 前画面に戻る。
        self.navigationController?.popViewController(animated: true)
        guard let frameVC = getFrameViewController() else { return }
        frameVC.navigationItem.leftBarButtonItem = nil
    }
}
