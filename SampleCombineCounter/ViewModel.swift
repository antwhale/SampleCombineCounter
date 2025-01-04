//
//  ViewModel.swift
//  SampleCombineCounter
//
//  Created by 부재식 on 1/4/25.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    init() {
        print("ViewModel init")
        
        descriptionPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.descriptionText, on: self)
            .store(in: &cancellableBag)
    }
    
    @Published var count: Int = 0
    @Published var inputText: String = ""
    @Published var descriptionText: String = ""
    var descriptionPublisher : AnyPublisher<String, Never> {
        return $inputText
            .map { "현재 텍스트의 길이는 " + String($0.count) + "입니다." }
            .eraseToAnyPublisher()
    }
    
    private var cancellableBag = Set<AnyCancellable>()
    
    func plus() {
        print("viewModel plus called")
        count += 1
    }
    
    func minus() {
        print("viewModel minus called")
        count -= 1
    }
    
    deinit {
        cancellableBag.removeAll()
    }
}
