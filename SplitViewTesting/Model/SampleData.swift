//
//  SampleData.swift
//  SplitViewTesting
//
//  Created by Ron Davis on 6/21/18.
//  Copyright © 2018 Reactuate Software. All rights reserved.
//

import Foundation

class SampleItem : CustomStringConvertible {
    var description: String {
        return "<\(type(of: self)) \(self.name)>"
    }
    
    var name : String = ""
}

class SampleParentItem : SampleItem {
    override var description: String {
        return "<\(type(of: self)): \(self.name) \(self.subItems.count) sub items>"
    }
    
    var subItems : [SampleItem] = []
    
    init(name:String) {
        super.init()
        self.name = name
    }
    
    func addSubItem(_ subItem : SampleItem) {
        subItems.append(subItem)
    }
    
    
}
