//
//  Memos.swift
//  
//
//  Created by shinobu okano on 2015/06/22.
//
//

import Foundation
import CoreData

@objc(Memos)
class Memos: NSManagedObject {

    @NSManaged var memo: String
    @NSManaged var date: NSDate

}
