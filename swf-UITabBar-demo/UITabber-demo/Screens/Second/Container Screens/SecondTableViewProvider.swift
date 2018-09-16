//
//  SecondTableViewProvider.swift
//  UITabber-demo
//
//  Created by Sho Emoto on 2018/09/12.
//  Copyright © 2018年 Sho Emoto. All rights reserved.
//

import UIKit

class SecondTableViewProvider: NSObject {

    let testData = ["4", "5", "6"]
}

extension SecondTableViewProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSecond",for: indexPath)
        
        cell.textLabel?.text = testData[indexPath.row]
        
        return cell
    }
}
