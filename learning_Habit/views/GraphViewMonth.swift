//
//  GraphView.swift
//  Habit
//
//  Created by Alex Barajas on 4/23/21.
//

import SwiftUI
import CoreData

struct GraphViewMonth: View {
    var datePairs: [[Date?]] = []
    
    init(){
        initalizeDates()
    }
    
    var body: some View {
        Text("Month")
        ZStack(alignment: .bottomLeading){
            graphBackground()
            drawBars()
        }
    }
    
    func drawBars() -> some View {
        return HStack{
            ForEach(datePairs, id: \.self){ pair in
                barView(day: pair)
            }
        }
    }
    
    func graphBackground() -> some View {
        return VStack(){
            Spacer()
                .frame(height: 15)
            ForEach(0..<10){ _ in
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 350, height: 1, alignment: .leading)
                Spacer()
                    .frame(height: 9)
            }
        }
        .padding(.bottom, 10)
    }
    
    mutating func initalizeDates(){
        var temp: [[Date?]] = []
        for index in stride(from: -7, through: -28, by: -7) {
            print("Month Index \(index)")
            let toDateTemp = Date()
            var dateComponent = DateComponents()
            dateComponent.day = index
            let fromDate = Calendar.current.date(byAdding: dateComponent, to: toDateTemp)
            
            var dateComponent_1 = DateComponents()
            dateComponent_1.day = index + 7
            //dateComponent.hour = 12
            let toDate = Calendar.current.date(byAdding: dateComponent_1, to: toDateTemp)
            
            let temp1:[Date?] = [fromDate, toDate]
            temp.append(temp1)
   
        }
        self.datePairs = temp
    }
    
}

struct barView: View{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Activity_Entry.fetchAll()) var entriesRe: FetchedResults<Activity_Entry>
    var day: [Date?]

    var body: some View{
        let request = Activity_Entry.fetchRequest() as NSFetchRequest<Activity_Entry>
        let predicate = NSPredicate(format: "%@ <= date_added AND date_added <= %@", day[0]! as NSDate, day[1]! as NSDate)
        request.predicate = predicate
        request.sortDescriptors = [NSSortDescriptor(key: "category", ascending: true)]
        let weekOfTheMonth = getDate(day: day[1])
        return VStack{
            buildBar(list: FetchRequest(fetchRequest: request), weekOfTheMonth: weekOfTheMonth)
//            Text("\(getDate(day: day[1]))")
//                .font(.footnote)
        }
    }
    
    func getDate(day: Date?) -> String{
        let today = day!
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        return formatter1.string(from: today)
    }
}




struct buildBar: View {
    @FetchRequest var list: FetchedResults<Activity_Entry>
    let weekOfTheMonth: String
    var body: some View {
        VStack{
            let temp = list.count > 0 ? "\(list.count) / 35 " : " "
            let size = list.count
            Text(temp)
                .font(.subheadline)
            let yValue = (Float(list.count) / 35) * 100
            VStack(alignment: .trailing, spacing: 0){
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 20, height: CGFloat(yValue), alignment: .center)
            }
        }
        Text(weekOfTheMonth)
            .frame(alignment: .bottomLeading)
            .font(.custom("test", size: 10.0))
            .opacity(list.count > 0 ? 1.0 : 0.0)
    }
    
    func grabColor(category: Activity_Entry) -> Color{
        let category = category.category
        if category == "Relaxation"{
            return Color.blue
        }
        if category == "Learning"{
            return Color.green
        }
        if category == "Reading"{
            return Color.red
        }
        if category == "Physical Health"{
            return Color.orange
        }
        if category == "Organization"{
            return Color.black
        }
        return Color.white
    }
    
}


struct GraphViewMonth_Previews: PreviewProvider {
    static var previews: some View {
        GraphViewMonth()
    }
}
