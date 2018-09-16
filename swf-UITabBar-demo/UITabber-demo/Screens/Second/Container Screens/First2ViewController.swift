//
//  First2ViewController.swift
//  UITabber-demo
//
//  Created by Sho Emoto on 2018/09/12.
//  Copyright © 2018年 Sho Emoto. All rights reserved.
//

import UIKit

class First2ViewController: UIViewController {

    @IBOutlet weak var secondTableView: UITableView!
    
    private let dataSource = SecondTableViewProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        secondTableView.dataSource = dataSource
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPathForSelectedRow = secondTableView.indexPathForSelectedRow {
            secondTableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
}

// MARK: - UITableViewDelegate
extension First2ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDetail()
    }
}

// MARK: - File Extension
extension First2ViewController {
    
    // MARK: - 画面遷移用メソッド
    
    private func toDetail() {
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let detailVC = storyboard.instantiateInitialViewController()
        
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
}
