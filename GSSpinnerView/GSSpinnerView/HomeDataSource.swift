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
        let selectedCell = tableView.cellForRow(at: indexPath)
        let spinnerView  = GSSpinnerView.init()
        spinnerView.initialPoint = CGPoint.init(x: (selectedCell?.frame.origin.x)! + 10, y: (selectedCell?.frame.origin.y)! + (selectedCell?.frame.size.height)! + 30)
        spinnerView.tableViewWidth = (selectedCell?.frame.size.width)!
        spinnerView.numberOfRows = 5
        spinnerView.showSpinnerView()
    }
}
