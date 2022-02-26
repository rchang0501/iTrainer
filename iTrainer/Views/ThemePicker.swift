//
//  ThemePicker.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-25.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme 
    
    var body: some View {
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme) // tag is used to differentiate between subviews 
            }
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
