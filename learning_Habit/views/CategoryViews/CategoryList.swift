//
//  CategoryList.swift
//  Habit
//
//  Created by AustinEscalante on 4/16/21.
//

import SwiftUI

struct CategoryList: View {
    var body: some View {
        GeometryReader { geometry in
            body(geometry)
        }
    }
    
    
    func body(_ geometry: GeometryProxy) -> some View {
        print(geometry.size)
        let chartArea = geometry.size.height * 0.20
        let categoryAreaWidth = geometry.size.height - (chartArea + 44)
        return
            NavigationView{
                VStack(){
                    List(categories){ category in
                        NavigationLink(destination: DetailedView(category: category)){
                            CategoryRow(category: category)
                        }
                        
                    }.frame(width: geometry.size.width, height: categoryAreaWidth, alignment: .center)
                    
                    List(){
                        NavigationLink(destination: ProgressView()) {
                            Text("Progress")
                        }
                    }.frame(width: geometry.size.width, height: 100, alignment: .center)
                    .navigationTitle("Habit")
                } // end of VStack
            } // end of Nav
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}

