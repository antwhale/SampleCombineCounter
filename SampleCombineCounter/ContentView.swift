//
//  ContentView.swift
//  SampleCombineCounter
//
//  Created by 부재식 on 1/4/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            
            Text(String(viewModel.count))
            
            Spacer().frame(height: 10)

            Button(action: {
                viewModel.plus()
            }, label: {
                Text("Plus")
            })
            
            Spacer().frame(height: 10)
            
            Button(action: {
                viewModel.minus()
            }, label: {
                Text("Minus")
            })
            
            Spacer().frame(height: 20)
            
            Text(viewModel.inputText)
            
            Spacer().frame(height: 10)
            
            Text(viewModel.descriptionText)

            Spacer().frame(height: 10)
            
            TextField("텍스트를 입력하세요", text: $viewModel.inputText)
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
                .keyboardType(.default)
        }
        .padding()
    }
}

#Preview {
 
    ContentView(viewModel : ViewModel())
}
