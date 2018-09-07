//
//  GSSpinnerView.swift
//  GSSpinnerView
//
//  Created by Keshav arora on 9/6/18.
//  Copyright © 2018 Gurunath Sripad. All rights reserved.
//

import UIKit

protocol GSSpinnerViewDelegate {
    func didSelectItem(selectedObject: AnyObject)
}

class GSSpinnerView: UIView {

    var tableView:UITableView?
    let tableViewDataSource = SpinnerTableViewDataSource()
    var spinnerItems:Array<GSSpinnerMappable>?
    var delegate:GSSpinnerViewDelegate?
    var accessButton:UIButton?
    var initialPoint:CGPoint?
    var tableViewWidth:CGFloat = 0.0
    
    required init() {
        super.init(frame: (UIApplication.shared.delegate!.window??.frame)!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func configure() {
        guard let appWindow = UIApplication.shared.delegate?.window, let frame = appWindow?.frame else {
            return
        }
        tableViewDataSource.spinnerItems = []
        if let spinnerItems = spinnerItems, spinnerItems.count > 0 {
            for spinnerItem in spinnerItems {
                if let spinnerObject = spinnerItem as? GSSpinnerMappable {
                    tableViewDataSource.spinnerItems?.append(spinnerObject)
                }
            }
        }
        accessButton = UIButton.init(type: .custom)
        accessButton!.frame = frame
        accessButton!.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.7)
        accessButton!.addTarget(self, action: #selector(removeSpinnerView), for: .touchUpInside)
        
        let height = CGFloat.init((tableViewDataSource.spinnerItems?.count ?? 0) * 44)
        if let point = initialPoint {
            if point.y + height < frame.height{
                tableView = UITableView.init(frame: CGRect.init(x: point.x, y: point.y, width: tableViewWidth, height: height))
            }
            else if (point.y - height - 44) > 0 {
                tableView = UITableView.init(frame: CGRect.init(x: point.x, y: point.y - height - 44, width: tableViewWidth, height: height))
            }
            else {
                tableView = UITableView.init(frame: CGRect.init(x: point.x, y:point.y, width: tableViewWidth, height: frame.height - point.y))
            }
            tableView!.delegate = tableViewDataSource
            tableView!.dataSource = tableViewDataSource
            tableViewDataSource.delegate = self
        }
    }
    
    func showSpinnerView() {
        configure()
        if let accessButton = accessButton, let tableView = tableView {
            self.addSubview(accessButton)
            self.addSubview(tableView)
        }
        if let window = UIApplication.shared.delegate?.window {
            window?.addSubview(self)
        }
    }
    
    @objc func removeSpinnerView(sender: UIButton!) {
        self.removeFromSuperview()
    }
}

extension GSSpinnerView:SpinnerTableViewDelegate {
    func didSelectItem(atIndex index: Int) {
        if let spinnerSelectionDelegate = delegate, let items = spinnerItems {
            spinnerSelectionDelegate.didSelectItem(selectedObject: items[index] as AnyObject)
        }
    }
}


