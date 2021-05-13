//
//  model.swift
//  Habit
//
//  Created by Alex Barajas on 4/17/21.
//

import Foundation
import CoreData

struct HabitModel{

    
    public static func create(_ description:String, category: String, using managedObjectContext: NSManagedObjectContext){
        let newcategory = Activity_Entry(context: managedObjectContext)
        newcategory.activity_description = description
        newcategory.category = category
        newcategory.date_added = Date()
        newcategory.id = UUID()
        saveChanges(using: managedObjectContext)
    }

    public static func delete(goals: Activity_Entry, using managedObjectContext: NSManagedObjectContext) {
        managedObjectContext.delete(goals)
        saveChanges(using: managedObjectContext)
    }
    

static func saveChanges(using managedObjectContext: NSManagedObjectContext) {
    guard managedObjectContext.hasChanges else { return }
    
    do {
        print("print statement in saveChanges")
        try managedObjectContext.save()
    } catch {
        fatalError(error.localizedDescription)
    }
  }
}

struct Day: Identifiable{
    var score: Int
    var day: String
    let id = UUID()
}

struct Week: Identifiable{
    var score: Int
    var week_dates: String
    let id = UUID()
}



