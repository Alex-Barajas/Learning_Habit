//
//  ContentView.swift
//  learning_Habit
//
//  Created by Alex Barajas on 5/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .trailing){
            CategoryList()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
