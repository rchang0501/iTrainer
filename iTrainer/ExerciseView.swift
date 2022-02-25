//
//  ExerciseView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-24.
//

import SwiftUI

struct ExerciseView: View {
    let exercises: [DailyExercise]
    
    var body: some View {
        List {
            ForEach(exercises) { exercise in // ( ... ) is the initilizer
                CardView(exercise: exercise)
                    .listRowBackground(exercise.theme.mainColor)
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercises: DailyExercise.sampleData) // initialize with class parameters
    }
}
