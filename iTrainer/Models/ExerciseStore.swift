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
    
    // static func to load the data
    // Result is a single type that represents the outcome of an operation - whether it is a success or failure
    // load func accepts a completion closure that it call asychronously with either an array of ExerciseRoutine or an error
    static func load(completion: @escaping (Result<[ExerciseRoutine], Error>) -> Void ){
        // asynchronous block on a background queue (like coroutine)
        // DispatchQueues are fist-in first-out (FIFO) for which our app can submit tasks (means requests are processed in the order in which they arrive)
        // background tasks have the lowest priority of all tasks
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL() // contains the file URL
                guard let file = try? FileHandle(forReadingFrom: fileURL) else { // prevent errors from reading nil file
                    DispatchQueue.main.async {
                        completion(.success([])) // call completion handler with an empty array incase there's an error openning the file handle
                    }
                    return // end the task here if there was an error
                }
                let exerciseRoutine = try JSONDecoder().decode([ExerciseRoutine].self, from: file.availableData) // decode the file's available JSON data and store to this local variable
                DispatchQueue.main.async { // switch back to main thread to update
                    completion(.success(exerciseRoutine)) // pass decoded routines to the completion handler
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error)) // show error if there is trouble reading the file 
                }
            }
        }
    }
}
