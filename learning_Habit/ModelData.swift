//
//  ModelData.swift
//  Habit
//
//  Created by AustinEscalante on 4/16/21.
//

import Foundation

var categories: [Categories] = load("categories.json")

func load<T: Decodable>(_ filename: String) -> T {
    //conversion of bits and datatype
    let data: Data
    //bundle name of directory
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    //pull content into instance of data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        //creates json decoder, decode contents, create instances of T, landmark
        //returns and stored in landmarks
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

