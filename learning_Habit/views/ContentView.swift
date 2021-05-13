//
//  ContentView.swift
//  learning_Habit
//
//  Alexander Barajas-Ritchie & Austin Escalante
//  May 12th, 2021
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
