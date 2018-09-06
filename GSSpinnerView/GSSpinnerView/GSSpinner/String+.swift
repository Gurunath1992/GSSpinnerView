//
//  File.swift
//  GSSpinnerView
//
//  Created by Keshav arora on 9/6/18.
//  Copyright © 2018 Gurunath Sripad. All rights reserved.
//

import Foundation

extension String: GSSpinnerMappable {
    func spinnerItemMapper() -> [String : String] {
        var map:[String:String] = [:]
        map["primaryTitle"] = self
        return map
    }
}
