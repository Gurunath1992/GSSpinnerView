//
//  SpinnerTableViewDataSource.swift
//  GSSpinnerView
//
//  Created by Keshav arora on 9/6/18.
//  Copyright © 2018 Gurunath Sripad. All rights reserved.
//

import UIKit

protocol SpinnerTableViewDelegate {
    func didSelectItem(atIndex index:Int)
}

class SpinnerTableViewDataSource: NSObject {
    var delegate:SpinnerTableViewDelegate?
    var spinnerItems:[GSSpinnerMappable]?
}

//MARK: Table View Datasource
extension SpinnerTableViewDataSource:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let spinnerObjects = spinnerItems else {
            return 0
        }
        return spinnerObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let spinnerItems = spinnerItems {
            let spinnerMap = spinnerItems[indexPath.row].spinnerItemMapper()
            cell.textLabel?.text = spinnerMap["primaryTitle"]
        }
        
        return cell
    }
}

//MARK: Table View Delegate
extension SpinnerTableViewDataSource:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(atIndex: indexPath.row)
    }
}
