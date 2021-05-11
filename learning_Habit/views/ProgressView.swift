//
//  ProgressView.swift
//  Habit
//
//  Created by Alex Barajas on 4/28/21.
//

import SwiftUI
import CoreData

struct ProgressView: View {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var entries:[Activity_Entry] = []
    var week: [Day] = []
    
    let viewModel = HabitViewModel()
    
    init(){
        getRecentWeek()
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(geometry)
        }
    }
    
    func body(_ geometry: GeometryProxy) -> some View{
        let chartArea = geometry.size.height * 0.20
        let categoryAreaWidth = geometry.size.height - chartArea
        return VStack{
            //GraphViewWeek(week: viewModel.getRecentWeek())
            GraphViewWeek(week: week)
            Spacer().frame(height: 30)
            //GraphViewMonth(month: viewModel.getRecentMonth())
            //GraphViewMonth(month: getRecentMonth())
        }
        .frame(width: geometry.size.width, height: categoryAreaWidth, alignment: .center)
    }
    mutating func getRecentWeek(){
        for index in stride(from: -1, to: -2, by: -1) {
            
            let toDate = Date()
            var dateComponent = DateComponents()
            dateComponent.day = index
            //dateComponent.hour = 12
            let fromDate = Calendar.current.date(byAdding: dateComponent, to: toDate)
            
            do {
                let request = Activity_Entry.fetchRequest() as NSFetchRequest<Activity_Entry>
                let predicate = NSPredicate(format: "%@ < date_added AND date_added <= %@", fromDate! as NSDate, toDate as NSDate)
                request.predicate = predicate
                entries = try context.fetch(request)
            }
            catch{
                fatalError(error.localizedDescription)
            }
            var score = 0
            for entry in entries{
                if entry.category == "Relaxation"{
                    score += 1
                }
                if entry.category == "Learning"{
                    score += 1
                }
                if entry.category == "Reading"{
                    score += 1
                }
                if entry.category == "Physical Health"{
                    score += 1
                }
                if entry.category == "Organization"{
                    score += 1
                }
            }
            let newDay = Day(score: score, day: "Friday")
            self.week.append(newDay)
        }
    }
    
}

func getRecentMonth()-> [Day]{
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


//struct Day: Identifiable{
//    var score: Int
//    var day: String
//    let id = UUID()
//}
//
//struct Week: Identifiable{
//    var score: Int
//    var week_dates: String
//    let id = UUID()
//}


struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}


let month = [
    Week(score: 25, week_dates: "4/1 - 4/7"),
    Week(score: 27, week_dates: "4/8 - 4/14"),
    Week(score: 35, week_dates: "4/15 - 4/21"),
    Week(score: 30, week_dates: "4/22 - 4/30")
]
