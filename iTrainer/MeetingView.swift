//
//  ContentView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        // contains the main components of the view
        VStack { // this stacks the view vertically
            ProgressView(value: 5, total: 15) //this is the progress bar
            HStack { // stacks things next to each other
                VStack{
                    Text("Seconds Elapsed")
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                VStack{
                    Text("Seconds Remaining")
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
