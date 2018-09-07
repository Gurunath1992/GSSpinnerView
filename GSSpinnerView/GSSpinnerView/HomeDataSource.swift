//
//  HomeDataSource.swift
//  GSSpinnerView
//
//  Created by Keshav arora on 9/6/18.
//  Copyright © 2018 Gurunath Sripad. All rights reserved.
//

import UIKit
protocol HomeScreenDelegate {
   func showSpinnerView(withFrame frame:CGRect)
}
class HomeDataSource: NSObject {
    @IBOutlet weak var tableView: UITableView!
    var delegate:HomeScreenDelegate?
}

//MARK: Table View Datasource
extension HomeDataSource:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
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
        let selectedCell = tableView.cellForRow(at: indexPath)
        if let tableSelectionDelagate = delegate, let cellFrame = selectedCell?.frame {
            tableSelectionDelagate.showSpinnerView(withFrame: cellFrame)
        }
        
    }
}
