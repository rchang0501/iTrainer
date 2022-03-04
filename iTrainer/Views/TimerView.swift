//
//  ContentView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import SwiftUI
import AVFoundation

struct TimerView: View {
    @Binding var exercise: ExerciseRoutine
    @StateObject var exerciseTimer = ExerciseTimer() // @StateObject sets this instance as the source of truth
    
    private var player: AVPlayer {AVPlayer.sharedDingPlayer} // sharedDingPlayer is an extension to AVPlayer defined in AVPlayer+Ding
    
    var body: some View {
        // contains the main components of the view
        ZStack { // overlay
            RoundedRectangle(cornerRadius: 8.0)
                .fill(exercise.theme.mainColor)
            VStack { // this stacks the view vertically
                TimerHeaderView(secondsElapsed: exerciseTimer.secondsElapsed, secondsRemaining: exerciseTimer.secondsRemaining, theme: exercise.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                TimerFooterView(movements: exerciseTimer.movements, skipAction: exerciseTimer.skipMovement)
            }
        }
        .padding()
        .foregroundColor(exercise.theme.accentColor)
        .onAppear{ // lifecycle event for when the view appears on the screen
            exerciseTimer.reset(lengthInMinutes: exercise.lengthInMinutes, routineMovements: exercise.movements) // reset the timer to start a new session
            exerciseTimer.movementChangedAction = { // this is triggered when either the movement changes or the rest time begins
                player.seek(to: .zero) // ensures the file plays from the start
                player.play() // plays the audio file 
            }
            exerciseTimer.restChangedAction = { // this is triggered when either the movement changes or the rest time begins
                player.seek(to: .zero) // ensures the file plays from the start
                player.play() // plays the audio file
            }
            exerciseTimer.startExercise()
        }
        .onDisappear{
            exerciseTimer.stopExercise()
            let newHistory = History(movements: exercise.movements, lengthInMinutes: exercise.timer.secondsElapsed / 60)
            exercise.history.insert(newHistory, at: 0)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(exercise: .constant(ExerciseRoutine.sampleData[0]))
    }
}
