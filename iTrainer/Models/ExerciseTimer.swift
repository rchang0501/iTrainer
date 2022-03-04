//
//  ExerciseTimer.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-03-01.
//

import Foundation

// diff between class and struct --> struct + enums are value types whereas classes are reference types. Value types are kind of like an instance of data whereas reference types always refer back to some object
class ExerciseTimer: ObservableObject { // make class observable by using the ObservableObject protocol
    
    // NOTE** ExerciseTimer Movement is not the exact same as the ExerciseRoutine Movement
    
    // struct to keep track of exercise movements during the routine
    struct Movement: Identifiable {
        let name: String // name of movement
        var isCompleted: Bool // true is the movement is completed
        let id = UUID() // Id for Identifiable conformance
    }
    
    @Published var activeMovement = "" // published annotation tell the class which values need to trigger a UI update when the value changes 
    @Published var secondsElapsed = 0
    @Published var secondsRemaining = 0
    
    // all routine movements, listed in the order they will appear
    private(set) var movements: [Movement] = [] // private(set) makes the field publically accessible but not settable (this acts like a getter method to return the value of movements)
    
    // routine length
    private(set) var lengthInMinutes: Int
    
    // a closure (lambda) that is executed when a new movement begins
    var movementChangedAction: (() -> Void)?
    var restChangedAction: (() -> Void)? 
    
    private var timer: Timer? // timer class info: https://www.hackingwithswift.com/articles/117/the-ultimate-guide-to-timer
    private var timerStopped = false
    private var frequency: TimeInterval { 1.0 / 60.0 }
    private var lengthInSeconds: Int {lengthInMinutes * 60 }
    
    // ** potential change in the future to make more customizable **
    private var secondsPerMovement: Int = 40
    private var secondsPerRest: Int = 20
    
    private var secondsElapsedForMovement: Int = 0
    //private var secondsElapsedForRest: Int = 0
    
    private var movementIndex: Int = 0
    
    private var movementText: String {
        return "Movement \(movementIndex + 1): " + movements[movementIndex].name
    }
    private var restText: String {
        if (movementIndex < movements.count){
            return "Rest \(movementIndex + 1): " + movements[movementIndex + 1].name + " up next!"
        } else {
            return "Rest \(movementIndex + 1): congratulations, you're done!"
        }
    }
    
    
    private var startDate: Date?
    
    // Initailzie a new timer
    init(lengthInMinutes: Int = 0, routineMovements: [ExerciseRoutine.Movement] = []){
        self.lengthInMinutes = lengthInMinutes
        self.movements = routineMovements.movements
        secondsRemaining = lengthInSeconds
        activeMovement = movementText
    }
    
    // start the timer
    func startExercise() {
        changeToMovement(at: 0)
    }
    
    // stop the timer
    func stopExercise() {
        timer?.invalidate()
        timer = nil
        timerStopped = true
    }
    
    // move to the next movement
    func skipMovement() {
        changeToMovement(at: movementIndex + 1)
    }
    
    // change to movement at the specified index
    private func changeToMovement(at index: Int){
        if index > 0 {
            let previousMovementIndex = index - 1
            movements[previousMovementIndex].isCompleted = true
        }
        secondsElapsedForMovement = 0
        //secondsElapsedForRest = 0
        
        // avoid out of bounds error
        guard index < movements.count else { return }
        
        movementIndex = index
        //activeMovement = movementText // need to change this based on time
        
        secondsElapsed = index * (secondsPerMovement + secondsPerRest)
        secondsRemaining = lengthInSeconds - secondsElapsed
        startDate = Date()
        
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true){
            [weak self] timer in
            if let self = self, let startDate = self.startDate {
                let secondsElapsed = Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
                self.update(secondsElapsed: Int(secondsElapsed))
            }
        }
    }
    
    // update states
    private func update(secondsElapsed: Int){
        secondsElapsedForMovement = secondsElapsed
        self.secondsElapsed = (secondsPerMovement + secondsPerRest) * movementIndex + secondsElapsedForMovement
        guard secondsElapsed <= (secondsPerMovement + secondsPerRest) else {
            return
        }
        secondsRemaining = max(lengthInSeconds - self.secondsElapsed, 0)
        
        guard !timerStopped else { return }
        
        if secondsElapsedForMovement < (secondsPerMovement - 1) {
            activeMovement = movementText
        } else if secondsElapsedForMovement < (secondsPerMovement + secondsPerRest) && secondsElapsedForMovement >= (secondsPerMovement - 1) {
            activeMovement = restText
            if (secondsElapsedForMovement == (secondsPerMovement - 1)){ // - 1 likely due to how the time is calculated
                restChangedAction?()
            }
        } else if secondsElapsedForMovement >= (secondsPerMovement + secondsPerRest) {
            changeToMovement(at: movementIndex + 1)
            movementChangedAction?()
        }
    }
    
    // reset the timer with a new routine length and new movements
    func reset(lengthInMinutes: Int, routineMovements: [ExerciseRoutine.Movement]){
        self.lengthInMinutes = lengthInMinutes
        self.movements = routineMovements.movements
        secondsRemaining = lengthInSeconds
        activeMovement = movementText // ** may need to check for edge cases
    }
    
} // class ExerciseTimer: ObservableObject

extension ExerciseRoutine {
    // new timer using the routine length and movements in the ExerciseRoutine
    var timer: ExerciseTimer {
        ExerciseTimer(lengthInMinutes: lengthInMinutes, routineMovements: movements)
    }
}

extension Array where Element == ExerciseRoutine.Movement {
    var movements: [ExerciseTimer.Movement] {
        if isEmpty {
            return [ExerciseTimer.Movement(name: "Movement 1", isCompleted: false)]
        } else {
            return map { ExerciseTimer.Movement(name: $0.name, isCompleted: false) }
        }
    }
}
