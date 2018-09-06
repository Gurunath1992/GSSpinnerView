//
//  HomeDataSource.swift
//  GSSpinnerView
//
//  Created by Keshav arora on 9/6/18.
//  Copyright © 2018 Gurunath Sripad. All rights reserved.
//

import UIKit

class HomeDataSource: NSObject {

    @IBOutlet weak var tableView: UITableView!
}

//MARK: Table View Datasource
extension HomeDataSource:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
}

//MARK: Table View Delegate

extension HomeDataSource:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row \(indexPath.row + 1)")
        let spinnerView  = GSSpinnerView.init()
        UIApplication.shared.delegate?.window!?.addSubview(spinnerView)
    }
}
