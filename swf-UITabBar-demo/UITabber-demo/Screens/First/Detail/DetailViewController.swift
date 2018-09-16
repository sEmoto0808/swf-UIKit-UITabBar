//
//  DetailViewController.swift
//  UITabber-demo
//
//  Created by Sho Emoto on 2018/09/12.
//  Copyright © 2018年 Sho Emoto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setBackButton()
    }
        
    @IBAction func didTapPush(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "DetailSecondViewController", bundle: nil)
        let detailVC = storyboard.instantiateInitialViewController()
        
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
    
}
