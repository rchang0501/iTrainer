//
//  iTrainerApp.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import SwiftUI

@main
struct iTrainerApp: App {
    @State private var exercises = DailyExercise.sampleData // root source of truth for all the data being passed
    
    var body: some Scene { // app property returns a scene that contains a view hierarchy representing the primary UI for the app
        WindowGroup { // window group is one of the primitive scenes swiftui provides --> in iOS the views put in the window group scene builder are presented in a window that fills the entire screen
            NavigationView { // navigation container enables navigation of a stack of views in a hierarchy 
                ExerciseView(exercises: $exercises)
            }
        }
    }
}
