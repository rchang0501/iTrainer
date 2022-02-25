//
//  ContentView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        // contains the main components of the view
        VStack { // this stacks the view vertically
            ProgressView(value: 5, total: 15) //this is the progress bar
            HStack { // stacks things next to each other
                VStack(alignment: .leading){ // override default alignment which is center
                    Text("Seconds Elapsed")
                        .font(.caption) // these are modifier methods -> each modifier returns a new view
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer() // puts a space between the vstacks
                VStack(alignment: .trailing){
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
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
        .padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
