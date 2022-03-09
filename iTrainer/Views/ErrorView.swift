//
//  ErrorView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-03-08.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss // with the @Environment property wrapper you can read a value that the view's environment stores - such as the view's scene phase, presentation mode, visibility, or color scheme -> in this case we are going to access the view's dismiss structure and call it like a structure to dismiss this ErrorView
    
    var body: some View {
        NavigationView {
            VStack {
                Text("An Error Has Occured")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription) // Error provides a localized description key which describes the error that occurred 
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial) // material blur effect to make bkg look like frosted glass
            .cornerRadius(16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Dismiss") {
                        dismiss() // this is the environment variable that will trigger the view's dismiss structure 
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    
    // sample error for preview purposes
    enum SampleError: Error {
        case errorRequired
    }
    
    // mock an ErrorWrapper for preview purposes
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired, guidance: "Preview - You can ignore this")
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
