//
//  SearchViewModel.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

import Combine
import UIKit

import Foundation


@MainActor
class SearchViewModel: ObservableObject {
    private var cancellable: Set<AnyCancellable> = []
   
    @Published var searchText: String = ""
    @Published private(set) var sections: [Section] = []
    @Published private(set) var errorMessage: String?
    @Published private(set) var isLoading: Bool = false
    
    private let useCase: SearchUseCaseProtocol
    

    private var searchTask: Task<Void, Never>?
    
    init(useCase: SearchUseCaseProtocol) {
        self.useCase = useCase
        
        $searchText
            .debounce(for: .seconds(2), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] newQuery in
                guard let self = self else { return }
                self.performSearch(with: newQuery)
            }
            .store(in: &cancellable)
    }
    
    private func performSearch(with query: String) {
        
        searchTask?.cancel()
        
       
        guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            sections = []
            return
        }
        
    
        searchTask = Task {
            do {
            
                isLoading = true
                errorMessage = nil
                
             
                let results = try await useCase.search(query)
                
         
                if !Task.isCancelled {
                    sections = results
                }
            } catch {
            
                if !Task.isCancelled {
                    errorMessage = error.localizedDescription
                }
            }
            
          
            isLoading = false
        }
    }
}
