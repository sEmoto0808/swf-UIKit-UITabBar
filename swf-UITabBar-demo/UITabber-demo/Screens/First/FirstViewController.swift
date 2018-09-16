//
//  FirstViewController.swift
//  UITabber-demo
//
//  Created by Sho Emoto on 2018/09/11.
//  Copyright © 2018年 Sho Emoto. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var testTableView: UITableView!
    
    // MARK: - Properties
    
    private let dataSource = TableViewProvider()

    override func viewDidLoad() {
        super.viewDidLoad()

        testTableView.dataSource = dataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPathForSelectedRow = testTableView.indexPathForSelectedRow {
            testTableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
}

// MARK: - UITableViewDelegate
extension FirstViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDetail()
    }
}

// MARK: - File Extension
extension FirstViewController {
    
    // MARK: - 画面遷移用メソッド
    
    private func toDetail() {
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let detailVC = storyboard.instantiateInitialViewController()
        
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
}
