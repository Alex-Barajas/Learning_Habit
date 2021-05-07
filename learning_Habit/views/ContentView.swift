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
           //progressButton()
            //Text("test")
        }
    }
}

func progressButton() -> some View {
    NavigationView{
        NavigationLink(destination: ProgressView()) {
            Text("Progress")
        }
    }.frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
