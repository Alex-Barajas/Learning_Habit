//
//  CircleView.swift
//  Habit
//
//  Created by AustinEscalante on 4/16/21.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        //referred from assets
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.gray, lineWidth: 5.0))
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: categories[1].image)
    }
}

