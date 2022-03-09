//
//  ErrorWrapper.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-03-08.
//

import Foundation

// struct helps identify errors that are encountered during the app operaiton
struct ErrorWrapper: Identifiable {
    let id: UUID // necessary for the identifiable protocol
    let error: Error // use Error protocol to explicitly assign a type to an error-handling property
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String){
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
