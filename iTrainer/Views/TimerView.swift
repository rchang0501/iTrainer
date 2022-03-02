//
//  ContentView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import SwiftUI

struct TimerView: View {
    @Binding var exercise: DailyExercise
    
    var body: some View {
        // contains the main components of the view
        ZStack { // overlay
            RoundedRectangle(cornerRadius: 8.0)
                .fill(exercise.theme.mainColor)
            VStack { // this stacks the view vertically
                Circle()
                    .strokeBorder(lineWidth: 24)
                HStack {
                    Text("Movement 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding()
        .foregroundColor(exercise.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(exercise: .constant(DailyExercise.sampleData[0]))
    }
}
