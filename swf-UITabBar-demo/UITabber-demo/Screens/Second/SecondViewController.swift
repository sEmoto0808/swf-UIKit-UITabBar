//
//  SecondViewController.swift
//  UITabber-demo
//
//  Created by Sho Emoto on 2018/09/11.
//  Copyright © 2018年 Sho Emoto. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondContainerView: UIView!
    
    private enum Container: Int {
        case first = 1
        case second = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初期表示
        setFirstContainer()
    }
    
    
}

// MARK: - UITabBarDelegate
extension SecondViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        setContentViewController(item: item)
    }
}

// File Extension
extension SecondViewController {
    
    private func setContentViewController(item: UITabBarItem) {
        
        guard let selectedContent = Container(rawValue: item.tag) else { return }
        switch selectedContent {
        case .first:
            setFirstContainer()
            break
        case .second:
            setFirstContainer()
            break
        }
    }
    
    // MARK: - 画面遷移用メソッド
    
    private func toFirst() {
        let storyboard = UIStoryboard(name: "FirstViewController", bundle: nil)
        let firstVC = storyboard.instantiateInitialViewController()
        
        present(firstVC!, animated: true, completion: nil)
    }
    
    private func toSecond() {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        let secondVC = storyboard.instantiateInitialViewController()
        
        present(secondVC!, animated: true, completion: nil)
    }
    
    // MARK: - ContainerView用メソッド
    
    private func setFirstContainer() {
        
        // ContainerViewにセットされているViewを取り除く
        let subviews = secondContainerView.subviews
        if subviews.count > 0 {
            for subview in subviews {
                subview.removeFromSuperview()
            }
        }
        
        // ContainerViewにセットするViewControllerを取得
        let storyboard = UIStoryboard(name: "First2ViewController", bundle: nil)
        guard let firstVC = storyboard.instantiateInitialViewController() else { return }
        // セットしたViewControllerのタップアクションなどを有効にする
        addChildViewController(firstVC)
        
        // Viewのサイズ設定（Naviバーなどの考慮）
        guard let firstView = firstVC.view else { return }
        let firstViewHeight = secondContainerView.frame.size.height
        let firstViewWidth = secondContainerView.frame.size.width
        firstView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: firstViewWidth,
                                 height: firstViewHeight)
        
        // ContainerViewにセットする
        secondContainerView.addSubview(firstView)
        
        // addChildViewController()とセットで呼び出す
        // https://qiita.com/yimajo/items/a5e16fa0f9c332a55ccf
        firstVC.didMove(toParentViewController: self)
    }
    
    private func setSecondContainer() {
        let subviews = secondContainerView.subviews
        if subviews.count > 0 {
            for subview in subviews {
                subview.removeFromSuperview()
            }
        }
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        guard let secondVC = storyboard.instantiateInitialViewController() else { return }
        addChildViewController(secondVC)
        
        let secondView = secondVC.view
        let secondViewHeight = secondContainerView.frame.size.height
        let secondViewWidth = secondContainerView.frame.size.width
        
        secondView?.frame = CGRect(x: 0, y: 0, width: secondViewWidth, height: secondViewHeight)
        
        secondContainerView.addSubview(secondView!)
        
        secondVC.didMove(toParentViewController: self)
    }
}
