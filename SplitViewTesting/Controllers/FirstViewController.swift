//
//  FirstViewController.swift
//  SplitViewTesting
//
//  Created by Ron Davis on 6/19/18.
//  Copyright © 2018 Reactuate Software. All rights reserved.
//

import Cocoa

class FirstViewController: NSViewController, NSTableViewDelegate {

    @IBOutlet weak var projectTableView: NSTableView!
    @IBOutlet weak var projectNameLabel: NSTextField!
    
    var sampleData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for x in 1...5 {
            sampleData.append("Value # \(x)")
        }
    }

}

extension FirstViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return sampleData.count
    }
    
    // This is all you need if you are doing an NSCell version. It will show you the text in the default cell.
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return sampleData[row]
    }
}


