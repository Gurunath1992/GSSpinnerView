//
//  GSSpinnerView.swift
//  GSSpinnerView
//
//  Created by Keshav arora on 9/6/18.
//  Copyright © 2018 Gurunath Sripad. All rights reserved.
//

import UIKit

class GSSpinnerView: UIView {

    var tableView:UITableView?
    var accessButton:UIButton?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init() {
        super.init(frame: (UIApplication.shared.delegate!.window??.frame)!)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       configure()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        guard let window = UIApplication.shared.delegate?.window else {
            return
        }
        accessButton = UIButton.init(type: .custom)
        accessButton?.frame = (window?.frame)!
        accessButton?.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.7)
        accessButton?.tag = 1234
        accessButton?.addTarget(self, action: #selector(removeSpinnerView), for: .touchUpInside)
        self.addSubview(accessButton!)
        
        tableView = UITableView.init(frame: CGRect.init(x: 10, y: 10, width: 100, height: 100))
        tableView?.delegate = self
        tableView?.dataSource = self
        self.addSubview(tableView!)
        
    }
    
    @objc func removeSpinnerView(sender: UIButton!) {
        self.removeFromSuperview()
    }
}

extension GSSpinnerView:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Spinner table row \(indexPath.row)"
        return cell
    }
}

extension GSSpinnerView:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.removeFromSuperview()
    }
}
