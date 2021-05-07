//
//  CategoryRow.swift
//  Habit
//
//  Created by AustinEscalante on 4/16/21.
//

import SwiftUI

struct CategoryRow: View {
    var category: Categories
    
    var body: some View {
        HStack{
            category.image
            .resizable()
            .frame(width: 50, height: 50)
            Text(category.categoryName)
                .font(.title3)
            Spacer()
        }
        .padding()
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        return Group{
            CategoryRow(category: categories[0])
            CategoryRow(category: categories[1])
        }
    }
}

