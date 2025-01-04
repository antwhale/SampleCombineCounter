//
//  SampleCombineCounterApp.swift
//  SampleCombineCounter
//
//  Created by 부재식 on 1/4/25.
//

import SwiftUI

@main
struct SampleCombineCounterApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = ViewModel()
            ContentView(viewModel: viewModel)
        }
    }
}
