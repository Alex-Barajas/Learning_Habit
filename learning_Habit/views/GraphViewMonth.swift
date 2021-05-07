//
//  GraphView.swift
//  Habit
//
//  Created by Alex Barajas on 4/23/21.
//

import SwiftUI

struct GraphViewMonth: View {
    
    let month: [Week]
    var monthlyPercentage: String {
        let temp = Float(month.map {$0.score}.reduce(0, +)) / Float(month.count * 35)
        return String(format: "%.1f", temp * 100) + "%"
    }
    var body: some View {
        VStack{
            ZStack(alignment: .leading){
                VStack(){
                    Spacer()
                        .frame(height: 25)
                    ForEach(0..<16){ _ in
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 215, height: 1, alignment: .leading)
                            Spacer()
                                .frame(height: 10)
                    }
                }
                HStack(alignment: .lastTextBaseline){
                    ForEach(month, id: \.id){ week in
                        VStack{
                            Text("\(week.score)")
                            Rectangle()
                                .fill(week.score > 34 ? Color.orange : Color.blue)
                                .border(Color.black)
                                .frame(width: 25, height: CGFloat(week.score * 5))
                            Spacer().frame(height: 10)
                            Text(week.week_dates)
                                .rotationEffect(.degrees(15.00))
                                .font(.system(size: 10))
                        }
                    }
                    
                }
            }
            Text("Month completion percentage: " + monthlyPercentage)
                .padding()
        }
    }
}

struct GraphViewMonth_Previews: PreviewProvider {
    static var previews: some View {
        let month = [
            Week(score: 25, week_dates: "4/1 - 4/7"),
            Week(score: 27, week_dates: "4/8 - 4/14"),
            Week(score: 35, week_dates: "4/15 - 4/21"),
            Week(score: 30, week_dates: "4/22 - 4/30")
        ]
        GraphViewMonth(month: month)
    }
}


