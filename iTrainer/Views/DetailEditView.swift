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
    @State private var newMovementName: String = ""
    
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
            Section(header: Text("Movements")){
                ForEach(data.movements){ movement in
                    Text(movement.name)
                }
                .onDelete { indicies in
                    data.movements.remove(atOffsets: indicies)
                }
                HStack {
                    TextField("New Movement", text: $newMovementName)
                    Button(action: {
                        withAnimation{ // animate the action to add a new item
                            // declare a new movement object with the inputed name
                            let movement = DailyExercise.Movement(name: newMovementName)
                            data.movements.append(movement) // add the new movement object to the data movement list
                            newMovementName = "" // clear the new movement name for next entry
                        }
                    }) {
                        Image(systemName: "plus.app")
                    }
                    .disabled(newMovementName.isEmpty) // button only available if user types in a name 
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