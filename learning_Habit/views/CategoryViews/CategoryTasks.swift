//
//  CategoryTasks.swift
//  Habit
//
//  Created by AustinEscalante on 4/29/21.
//

import SwiftUI

struct TaskCell: View {
    @ObservedObject var entry: Activity_Entry
    var body: some View {
        HStack {
            Text(entry.activity_description ?? "")
                .foregroundColor(.black)
            Spacer()
        }
    }
}

