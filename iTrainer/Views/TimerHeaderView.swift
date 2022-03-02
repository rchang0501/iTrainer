//
//  TimerHeaderView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-03-01.
//

import SwiftUI

struct TimerHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(secondsRemaining)
    }
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    var body: some View {
        VStack{
            ProgressView(value: progress) //this is the progress bar
                .progressViewStyle(ExerciseProgressViewStyle(theme: theme))
            HStack { // stacks things next to each other
                VStack(alignment: .leading){ // override default alignment which is center
                    Text("Seconds Elapsed")
                        .font(.caption) // these are modifier methods -> each modifier returns a new view
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer() // puts a space between the vstacks
                VStack(alignment: .trailing){
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct TimerHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TimerHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .ocean)
            .previewLayout(.sizeThatFits)
    }
}
