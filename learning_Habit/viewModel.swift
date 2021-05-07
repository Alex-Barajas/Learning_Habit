//
//  viewModel.swift
//  Habit
//
//  Created by Alex Barajas on 4/17/21.
//

import Foundation
import CoreData


class HabitViewModel{
    
    
    
    lazy var managedObjectContext: NSManagedObjectContext = { self.persistentContainer.viewContext }()

    lazy var persistentContainer: NSPersistentContainer  = {
        let container = NSPersistentContainer(name: "Goals")
        container.loadPersistentStores { (persistentStoreDescription, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
        return container
    }()
    func getRecentWeek() -> [Day]{
        let week = [
            Day(score: 5, day: "Monday"),
            Day(score: 4, day: "Tuesday"),
            Day(score: 2, day: "Wednesday"),
            Day(score: 4, day: "Thusday"),
            Day(score: 1, day: "Friday"),
            Day(score: 5, day: "Saturday"),
            Day(score: 4, day: "Sunday")
        ]
        return week
    }
    
    func getRecentMonth() -> [Week]{
        let month = [
            Week(score: 25, week_dates: "4/1 - 4/7"),
            Week(score: 27, week_dates: "4/8 - 4/14"),
            Week(score: 35, week_dates: "4/15 - 4/21"),
            Week(score: 30, week_dates: "4/22 - 4/30")
        ]
        return month
    }
    
}

