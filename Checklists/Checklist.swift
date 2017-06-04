//
//  Checklist.swift
//  Checklists
//
//  Created by He Huang on 4/26/17.
//  Copyright © 2017 He Huang. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    var name = ""
    var items = [ChecklistItem]()
    var iconName: String
    required init?(coder aCoder: NSCoder){
        name = aCoder.decodeObject(forKey: "Name") as! String
        items = aCoder.decodeObject(forKey: "Items") as! [ChecklistItem]
        iconName = aCoder.decodeObject(forKey: "IconName") as! String
        super.init()
    }
    func encode(with aCoder: NSCoder){
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(items, forKey: "Items")
        aCoder.encode(iconName, forKey: "IconName")
    }
    
    convenience init(name: String){
        self.init(name: name, iconName: "No Icon")
    }
    
    init(name: String, iconName: String){
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems() -> Int{
        var count = 0
        for item in items where !item.checked{
            count+=1
        }
        return count
    }
}
