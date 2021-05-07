//
//  GraphView.swift
//  Habit
//
//  Created by Alex Barajas on 4/23/21.
//

import SwiftUI

struct GraphViewWeek: View {
    
    let week: [Day]
    var weeklyPercentage: String {
        let temp = Float(week.map {$0.score}.reduce(0, +)) / Float(week.count * 5)
        return String(format: "%.1f", temp * 100) + "%"
    }
    var body: some View {
        VStack{
            ZStack(alignment: .leading){
                VStack(){
                    Spacer()
                        .frame(height: 23)
                    ForEach(0..<10){ _ in
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 350, height: 1, alignment: .leading)
                            Spacer()
                                .frame(height: 10)
                    }
                }
                HStack(alignment: .lastTextBaseline){
                    ForEach(week, id: \.id){ day in
                        VStack{
                            Text("\(day.score)")
                            Rectangle()
                                .fill(day.score > 4 ? Color.orange : Color.blue)
                                .border(Color.black)
                                .frame(width: 25, height: CGFloat(day.score * 20))
                            Text(day.day)
                                .rotationEffect(.degrees(0.00))
                                .font(.system(size: 10))
                        }
                    }
                    
                }
            }
            Text("Weekly completion percentage: " + weeklyPercentage)
                .padding()
        }
    }
}

struct GraphViewWeek_Previews: PreviewProvider {
    static var previews: some View {
        let week = [
            Day(score: 5, day: "Monday"),
            Day(score: 4, day: "Tuesday"),
            Day(score: 2, day: "Wednesday"),
            Day(score: 4, day: "Thursday"),
            Day(score: 1, day: "Friday"),
            Day(score: 5, day: "Saturday"),
            Day(score: 4, day: "Sunday")
        ]
        GraphViewWeek(week: week)
    }
}

