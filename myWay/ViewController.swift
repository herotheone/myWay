//
//  ViewController.swift
//  myWay
//
//  Created by Emin Türk on 19.09.2018.
//  Copyright © 2018 Emin Türk. All rights reserved.
//

import UIKit
import GRDB.Swift


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       

        let dbPath = Bundle.main.path(forResource: "db2", ofType:"sqlite")

        do {
            
            let dbQueue = try DatabaseQueue(path: dbPath!)
            
            try dbQueue.inDatabase { db in
                
                //Select all data from the table named tablename residing in SQLite
                var sayi  : Int = 0
                let rows = try Row.fetchCursor(db, "SELECT * FROM ZIMPORT")
                
                while let row = try rows.next() {
                    
                  let someString : String = row["gAnahtarKelime"]
                    let someString2 : String = row["gMana1"]
                    let someString3 : String = row["gMana2"]
                    let someString4 : String = row["gMana3"]
                    
                    print("Anahtar Kelime : \(someString)")
                    print("Mana 1 : \(someString2)")
                    print("Mana 2 : \(someString3)")
                    print("Mana 3 : \(someString4)")
                    
                    sayi = sayi + 1
                    print("Sayı: \(sayi)")
                    
                }
                
                
                
                
            }
            
            
        } catch {
            
            print(error.localizedDescription)
            
        }
    }

}


