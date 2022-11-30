//
//  ContentView.swift
//  Aula-WatchOS Watch App
//
//  Created by Gui Reis on 24/10/22.
//

import SwiftUI

struct ScrollNumberView: View {
    @State var num: Float = 0
    
    /* Input */
    var body: some View {
        Text("\(num, specifier: "%0.1f")")
            .focusable()
            .digitalCrownRotation(
                $num,
                from: 0.0,
                through: 10.0,
                by: 0.1,
                sensitivity: .medium,
                isContinuous: true,
                isHapticFeedbackEnabled: true
            )
    }
}


struct ContentView: View {
    @State var num: Float = 0
    
    /* Input */
    var body: some View {
        List{
            ForEach ((1...20), id: \.self) {
                Text("\($0)")
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
