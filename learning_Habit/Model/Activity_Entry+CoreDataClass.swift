//
//  Activity_Entry+CoreDataClass.swift
//  learning_Habit
//
//  Created by Alex Barajas on 5/4/21.
//
//

import Foundation
import CoreData

@objc(Activity_Entry)
public class Activity_Entry: NSManagedObject {
    
    
    
    static func fetchAll() -> NSFetchRequest<Activity_Entry> {
        let request = NSFetchRequest<Activity_Entry>(entityName: "Activity_Entry")
        request.sortDescriptors = [NSSortDescriptor(key: "category", ascending: true)]
        return request
    }
    
    static func fetchCat(catergory_string: String) -> NSFetchRequest<Activity_Entry> {
        let request = NSFetchRequest<Activity_Entry>(entityName: "Activity_Entry")
        request.sortDescriptors = [NSSortDescriptor(key: "category", ascending: true)]
        let predicate = NSPredicate(format: "category CONTAINS %@", catergory_string as CVarArg)
        request.predicate = predicate
        return request
    }
    
    
}
