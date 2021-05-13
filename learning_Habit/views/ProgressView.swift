//
//  ProgressView.swift
//  Habit
//
//  Created by Alex Barajas on 4/28/21.
//

import SwiftUI
import CoreData

struct ProgressView: View {
    
    //    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //    @Environment(\.managedObjectContext) var managedObjectContext
    //
    
    
    
    //var entries:[Activity_Entry] = []
   // var week: [Day] = []
    
   // let viewModel = HabitViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            body(geometry)
        }
    }
    
    func body(_ geometry: GeometryProxy) -> some View{
        let chartArea = geometry.size.height * 0.20
        let categoryAreaWidth = geometry.size.height - chartArea
        
        return VStack{
            GraphViewWeek()
            Spacer().frame(height: 30)
            GraphViewMonth()
        }
        .frame(width: geometry.size.width, height: categoryAreaWidth, alignment: .center)
    }
    
}
