//
//  DetailCoursePresenter.swift
//  AppVIPER
//
//  Created by Igor on 11.03.2022.
//

struct DetailCourseData {
    
}

class DetailCoursePresenter: DetailCourseViewOutputProtocol {
    unowned let view: DetailCourseViewInputProtocol
    var interactor: DetailCourseInteractorInputProtocol!
    
    required init(view: DetailCourseViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        
    }
}

// MARK: - DetailCourseInteractorOutputProtocol
extension DetailCoursePresenter: DetailCourseInteractorOutputProtocol {
    
}
