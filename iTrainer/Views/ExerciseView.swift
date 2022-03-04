//
//  ExerciseView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-24.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var exercises: [ExerciseRoutine]
    @State private var isPresentingNewExerciseView: Bool = false
    @State private var newExerciseData = ExerciseRoutine.Data()
    
    var body: some View {
        List {
            ForEach($exercises) { $exercise in // ( ... ) is the initilizer
                NavigationLink(destination: DetailView(exercise: $exercise)){
                    CardView(exercise: exercise)
                }
                .listRowBackground(exercise.theme.mainColor)
            }
        }
        .navigationTitle("Exercise Routines")
        .toolbar {
            Button(action: {
                isPresentingNewExerciseView = true // trigger the modal sheet to show 
            }) {
                Image(systemName: "plus.circle")
            }
            .accessibilityLabel("New Exercise")
        }
        .sheet(isPresented: $isPresentingNewExerciseView){ // modal sheet that will show the create new exercise view
            NavigationView {
                DetailEditView(data: $newExerciseData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewExerciseView = false
                                newExerciseData = ExerciseRoutine.Data() // reset to prepare for next entry
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newData = ExerciseRoutine(data: newExerciseData) // createe a new ExerciseRoutine object, initializing with the modified data
                                exercises.append(newData) // add the new entry to the array of exercises
                                isPresentingNewExerciseView = false
                                newExerciseData = ExerciseRoutine.Data() // reset to prepare for next entry
                            }
                        }
                    }
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // adding this shows titles and bar buttons on the canvas
            ExerciseView(exercises: .constant(ExerciseRoutine.sampleData)) // initialize with class parameters
        }
    }
}
