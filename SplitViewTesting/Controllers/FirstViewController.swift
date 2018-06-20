//
//  FirstViewController.swift
//  SplitViewTesting
//
//  Created by Ron Davis on 6/19/18.
//  Copyright © 2018 Reactuate Software. All rights reserved.
//

import Cocoa

class FirstViewController: NSViewController  {

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

let TABLE_VIEW_CELL_ID = "tableCellView"

extension FirstViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    //MARK: - Data Source Methods
    func numberOfRows(in tableView: NSTableView) -> Int {
        return sampleData.count
    }
    
    //MARK: - Tableview Delegate
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var returnView: NSTableCellView
        
        returnView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(TABLE_VIEW_CELL_ID), owner: self) as! NSTableCellView
        returnView.textField?.stringValue = sampleData[row]
        
        return returnView
    }
}


