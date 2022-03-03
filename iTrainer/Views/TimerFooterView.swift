//
//  TimerFooterView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-03-02.
//

import SwiftUI

struct TimerFooterView: View {
    let movements: [ExerciseTimer.Movement]
    var skipAction: ()->Void
    
    private var movementNumber: Int? {
        // this gets the index in the array of movements of the first element that is not completed or returns nothing if that does not exist
        guard let index = movements.firstIndex(where: { !$0.isCompleted }) else { return nil } // $0 means first argument
        return index + 1
    }
    
    private var isLastMovement: Bool {
        return movements.dropLast().allSatisfy{$0.isCompleted} // returns true if each speaker but the last speaker's .isCompleted property is true - this first drops the last element from the sequence (the last speaker) and then checks if all the remaining ones' .isCompleted property is true
    }
    
    private var movementText: String {
        guard let movementNumber = movementNumber else { return "No more movements"}
        return "Movement \(movementNumber) of \(movements.count)"
    }
    
    var body: some View {
        VStack{
            HStack {
                if isLastMovement {
                    Text("Last Movement")
                } else {
                    Text(movementText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct TimerFooterView_Previews: PreviewProvider {
    static var previews: some View {
        TimerFooterView(movements: DailyExercise.sampleData[0].movements.movements, skipAction: {}) // the second .movements is an extension defined in the ExerciseTimer class (yes it's not great naming convention and should be changed)
            .previewLayout(.sizeThatFits)
    }
}
