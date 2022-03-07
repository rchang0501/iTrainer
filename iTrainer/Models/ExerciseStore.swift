//
//  ExerciseStore.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-03-06.
//

import Foundation
import SwiftUI

class ExerciseStore: ObservableObject { // ObservableObject is a class protocal for connecting model data to SwiftUI views
    @Published var exercises: [ExerciseRoutine] = [] //ObservableObject contians WillChange publisher that emits the given value whenever a Published value is altered --> any view observing this instance will udpate the ui accordingly
    
    // the app will load and save exercises to a file in the user's documents folder --> this function makes it easier to access said file
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) //use the shared instance of the FileManager class to get the location of the user's documents folder
            .appendingPathComponent("exercises.data") // returns the URL of a file named exercises.data 
    }
}
