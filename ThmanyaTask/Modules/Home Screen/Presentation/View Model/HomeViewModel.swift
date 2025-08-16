//
//  HomeViewModel.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import Combine
import UIKit

class HomeViewModel: ObservableObject {
    
    private let useCase: HomeUseCaseProtocol
    private var cancellable: Set<AnyCancellable> = []
    
    init(useCase: HomeUseCaseProtocol) {
        self.useCase = useCase
    }
    
    @Published var text = "Hello, World!"
    @Published var sections : [Section] = []
    
    
    
    func fetchData() {
        useCase.getAppData()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                //
            } receiveValue: {[weak self] sections in
                guard let self else {return}
                self.sections = sections
            }
            .store(in: &cancellable)

    }
}
