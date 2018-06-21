//
//  SecondViewController.swift
//  SplitViewTesting
//
//  Created by Ron Davis on 6/19/18.
//  Copyright © 2018 Reactuate Software. All rights reserved.
//

import Cocoa

class SecondViewController: NSViewController {
    
    var sampleData = [SampleParentItem]()
    var displayArray = [Any]()

    fileprivate func generateSampleData() {
        let daysOfTheWeek = ["Sunday","Monday","Tuesday","Wednesday", "Thursday","Friday","Saturday"]
        for i in 1...5 {
            let newItem = SampleParentItem(name: "\(daysOfTheWeek[i])")
            sampleData.append(newItem)
            for num in 1...(arc4random_uniform(3)+1) {
                let tempSubItem = SampleItem()
                tempSubItem.name = "An Item #\(num)"
                newItem.addSubItem(tempSubItem)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        generateSampleData()
        updateDisplayArray()
    }
    
    func updateDisplayArray() {
        displayArray = [Any]() // clean array
        for rootItem in sampleData {
            displayArray.append(rootItem)
            for subItem in rootItem.subItems {
                displayArray.append(subItem)
            }
        }
    }
    
}

let SECOND_TABLE_VIEW_CELL_ID = "secondTableCellView"

extension SecondViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    //MARK: - Data Source Methods
    func numberOfRows(in tableView: NSTableView) -> Int {
        return displayArray.count
    }
    
    //MARK: - Tableview Delegate
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var returnView: NSTableCellView
        
        returnView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(SECOND_TABLE_VIEW_CELL_ID), owner: self) as! NSTableCellView
        
        let curItem = displayArray[row] as! SampleItem
        
        if curItem is SampleParentItem {
            returnView.textField?.stringValue = curItem.name
        } else {
            returnView.textField?.stringValue = "  \(curItem.name)"
        }
        
        return returnView
    }
    
}
