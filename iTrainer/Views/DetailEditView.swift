//
//  DetailEditView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-25.
//

import SwiftUI

struct DetailEditView: View {
    // @State property wrapper defines the source of truth for value types (like live data) --> you make it prive so it's only accessible in the views that you defiend them in
    @State private var data = DailyExercise.Data()
    
    var body: some View {
        Form {
            Section(header: Text("Exercise Routine Info")){
                TextField("Title", text: $data.title) // $ creates a binding
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1){
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
