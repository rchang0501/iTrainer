//
//  DetailView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-24.
//

import SwiftUI

struct DetailView: View {
    @Binding var exercise: DailyExercise
    
    @State private var data = DailyExercise.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            // sections create visual distinctions in the list -> chunk groups and content for the view hierarchy
            Section(header: Text("Exercise Routine Info")){
                NavigationLink(destination: TimerView()) {
                    Label("Start Exercise Routine", systemImage: "play.fill")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock.arrow.circlepath")
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
                    Label("\(movement.name)", systemImage: "bolt.ring.closed")
                }
            }
        }
        .navigationTitle(exercise.title)
        .toolbar {
            Button("Edit"){
                isPresentingEditView = true
                data = exercise.data // replaces template empty data with referenced data from exercise view 
            }
        }
        // when isPresentingEditView changes to true, the app presents DetailEditView a modal sheet that partially covers the underlying content
        // modal views remove the user from the main navigation flow of the app. Use modality for short, self-contained tasks
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(exercise.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel"){
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Done"){
                                isPresentingEditView = false
                                exercise.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(exercise: .constant(DailyExercise.sampleData[0]))
        }
    }
}
