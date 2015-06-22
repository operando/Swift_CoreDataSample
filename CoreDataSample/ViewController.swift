//
//  ViewController.swift
//  CoreDataSample
//
//  Created by shinobu okano on 2015/06/22.
//  Copyright (c) 2015年 shinobu okano. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    
    // メモと日時を入れる配列を用意
    var memos: [NSString] = []
    var dates: [NSDate] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func wite(sender: UIButton) {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let memoContext: NSManagedObjectContext = appDel.managedObjectContext!
        let memoEntity: NSEntityDescription! = NSEntityDescription.entityForName("Memos", inManagedObjectContext: memoContext)
        let newData = Memos(entity: memoEntity, insertIntoManagedObjectContext: memoContext)
        newData.memo = text.text
        newData.date = NSDate()
        
        var error: NSError?
        if !memoContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        println("object saved")
    }

    @IBAction func read(sender: UIButton) {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let memoContext: NSManagedObjectContext = appDel.managedObjectContext!
        let memoRequest: NSFetchRequest = NSFetchRequest(entityName: "Memos")
        memoRequest.returnsObjectsAsFaults = false
        var results: NSArray! = memoContext.executeFetchRequest(memoRequest, error: nil)
        
        memos = []
        dates = []
        
        for data in results {
            memos.append(data.memo)
            dates.append(data.date)
        }
        
        // コンソールに表示
        println(memos)
        println(dates)
    }
}

