//
//  HomeViewModel.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import Combine
import UIKit

@MainActor
class HomeViewModel: ObservableObject {
    
    private let useCase: HomeUseCaseProtocol
    private var cancellable: Set<AnyCancellable> = []
    
    init(useCase: HomeUseCaseProtocol) {
        self.useCase = useCase
    }
    
    @Published var sections : [Section] = []
    @Published var isDataLoaded: Bool = false
    @Published var error: String?
    @Published var isLoading = false
    
    private var currentPage: Int = 1
    private var totalPages: Int = 1
    private var isEndPages: Bool {
        currentPage >= totalPages
    }
    private var pageTrigger: Int = 10
    
    func fetchFirstTime() async{
        
        resetPaging()
        await fetchData(page: 1)
    }
    
    func getNextPage(index: Int) async{
        DLog("(((((index:\(index))))))")
        let isAtTrigger = (index + 1) % pageTrigger == 0
        guard isAtTrigger , !isLoading , !isEndPages else { return }
        let nextPageIndex = currentPage + 1
        await fetchData(page: nextPageIndex)
    }
    
    func resetPaging(){
        sections.removeAll()
        currentPage = 1
        totalPages = 1
        isDataLoaded = false
        isLoading = false
    }
   
    @MainActor
    func fetchData(page: Int) async {
        isLoading = true
        error = nil
        
        do {
            let appData = try await useCase.getAppData(page: page)
            
            
            self.sections.append(contentsOf: appData.sections)
            self.totalPages = appData.pagination?.totalPages ?? 10
            currentPage = page
            isDataLoaded = true
        } catch {
            
            self.error = error.localizedDescription
        }
        
        isLoading = false
    }
}
