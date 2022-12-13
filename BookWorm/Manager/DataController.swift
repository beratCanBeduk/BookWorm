//
//  DataController.swift
//  BookWorm
//
//  Created by berat can beduk on 12.12.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BookWorm")
    
    init() {
        container.loadPersistentStores { description, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
                        
        }
    }
}
