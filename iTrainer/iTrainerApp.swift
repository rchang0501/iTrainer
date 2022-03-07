//
//  iTrainerApp.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import SwiftUI

@main // indicates that this is the only entry point to the app 
struct iTrainerApp: App { // use the app protocol to create an app
    // @State private var exercises = ExerciseRoutine.sampleData // root source of truth for all the data being passed
    @StateObject private var store = ExerciseStore() // @StateObject creates and initializes a single instance of an observed object for each instance of a structure that declares it (source of truth)
    
    var body: some Scene { // app property returns a scene that contains a view hierarchy representing the primary UI for the app
        WindowGroup { // window group is one of the primitive scenes swiftui provides --> in iOS the views put in the window group scene builder are presented in a window that fills the entire screen
            NavigationView { // navigation container enables navigation of a stack of views in a hierarchy
                ExerciseView(exercises: $store.exercises) {
                    ExerciseStore.save(exercises: store.exercises) { result in // pass the saveAction closure to the List view in ExerciseView
                        if case .failure(let error) = result { // remember result is a lambda for the second parameter of save
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .onAppear { // lifecycle event for when a view appears on the screen
                ExerciseStore.load { result in // call the load static method in exercise store to get all the exercise routines
                    switch result { // switch the result based on whether the load was successful
                    case .failure(let error):
                        fatalError(error.localizedDescription) // when the result is an error throw the error
                    case .success(let exercises):
                        store.exercises = exercises // when the result is an array of ExerciseRoutine (successful) set the returned value to the soruce of truth
                    }
                }
            }
        }
    }
}

