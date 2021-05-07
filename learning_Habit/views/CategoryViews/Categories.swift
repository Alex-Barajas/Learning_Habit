//
//  Categories.swift
//  Habit
//
//  Created by AustinEscalante on 4/16/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Categories: Hashable, Codable, Identifiable{
    var id: Int
    var categoryName: String
    
    //computed properties
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}

