//
//  TimerCircleView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-03-10.
//

import SwiftUI

// central view where we'll be showing the progress of the specific movement
struct TimerCircleView: View {
    let movements: [ExerciseTimer.Movement]
    let theme: Theme
    
    // computed property that gets the first movemnet that is not completed
    // if there isn't a current movement the value returns "Something"
    private var currentMovement: String {
        movements.first(where: {!$0.isCompleted})?.name ?? "Something"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay{
                VStack {
                    Text("\(currentMovement)")
                        .font(.title)
                    Text("is in progress")
                }
                .accessibilityElement(children: .combine) // ensures elemnts in the VStack are considered a single one
                .foregroundStyle(theme.accentColor)
            }
            .overlay{
                ForEach(movements) { movement in
                    // finds the index of the movement that just completed (to know to draw the arc)
                    if movement.isCompleted, let index = movements.firstIndex(where: {$0.id == movement.id }){
                        MovementArc(movementIndex: index, totalMovements: movements.count) // create the MovementArc shape
                            .rotation(Angle(degrees: -90)) // apply rotation to set the 0 degree angle to the 12 o'clock position
                            .stroke(theme.mainColor, lineWidth: 12) // this is the colored portion of the arc
                    }
                }
            }
            .padding(.horizontal)
    }
}

struct TimerCircleView_Previews: PreviewProvider {
    // static array of sample data
    static var movementPreviews = [ExerciseTimer.Movement(name: "Dummbell Press", isCompleted: true), ExerciseTimer.Movement(name: "Dummbell Fly", isCompleted: false)]
    
    static var previews: some View {
        TimerCircleView(movements: movementPreviews, theme: .lavender)
    }
}
