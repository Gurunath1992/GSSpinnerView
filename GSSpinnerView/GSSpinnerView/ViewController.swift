//
//  ViewController.swift
//  GSSpinnerView
//
//  Created by Keshav arora on 9/6/18.
//  Copyright © 2018 Gurunath Sripad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dataSource: HomeDataSource!
    var spinnerView:GSSpinnerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:HomeScreenDelegate {
    func showSpinnerView(withFrame spinnerFrame:CGRect) {
        spinnerView  = GSSpinnerView.init()
        if let spinnerView = spinnerView {
            let strings = ["one","two","three","four", "five","six","seven","eight","nine","ten"]
            spinnerView.spinnerItems = strings as? Array<GSSpinnerMappable>
            spinnerView.delegate = self
            spinnerView.initialPoint = CGPoint.init(x: spinnerFrame.origin.x + 10, y: spinnerFrame.origin.y + spinnerFrame.size.height + 30)
            spinnerView.tableViewWidth = spinnerFrame.size.width
            spinnerView.showSpinnerView()
        }
    }
}

extension ViewController:GSSpinnerViewDelegate {
    func didSelectItem(selectedObject: AnyObject) {
        if let spinnerView = spinnerView {
            spinnerView.removeFromSuperview()
        }
    }
}
