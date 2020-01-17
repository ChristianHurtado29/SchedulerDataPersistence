//
//  PersistenceHelper.swift
//  Scheduler
//
//  Created by Christian Hurtado on 1/17/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

enum DataPersistenceError: Error{
    case savingError(Error) // associated value
}

class PersistenceHelper {
    
    // CRUD - Create, Read, Update, Delete
    
    // array of events
    private static var events = [Event]()
    
    private static let filename = "schedules.plist"
    
    // create - save items to documents directory
    static func save(event: Event) throws {
        
        // step 1
        // get url path the file that the Event will be saved to
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        
        // step 2
        // append new event to the events array
        events.append(event)
        
        // events array will be object being converted to Data
        // we will use the Data object to write (save) it to documents directory
        do {
            // step 3
            // convert (serialize) the events array to Data
            let data = try PropertyListEncoder().encode(events)
            
            // step 4
            // writes, saves, persist the data to the documents directory
            try data.write(to: url, options: .atomic)
        } catch {
            // step 5
            throw DataPersistenceError.savingError(error)
        }
        
        
    }
    
    // read - load (retrieve) items from documents directory
    // update -
    // delete - remove item from documents directory
}
