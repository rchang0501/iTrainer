//
//  DetailView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-24.
//

import SwiftUI

struct DetailView: View {
    let exercise: DailyExercise
    
    var body: some View {
        List {
            // sections create visual distinctions in the list -> chunk groups and content for the view hierarchy
            Section(header: Text("Exercise Routine Info")){
                Label("Start Exercise Routine", systemImage: "play.fill")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                HStack {
                    Label("Lenght", systemImage: "clock.arrow.circlepath")
                    Spacer()
                    Text("\(exercise.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(exercise.theme.name)")
                        .padding(4)
                        .foregroundColor(exercise.theme.accentColor)
                        .background(exercise.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Movements")){
                ForEach(exercise.movements) { movement in 
                    Label("\(movement.name)", systemImage: "bolt.horizontal.fill")
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(exercise: DailyExercise.sampleData[0])
        }
    }
}
