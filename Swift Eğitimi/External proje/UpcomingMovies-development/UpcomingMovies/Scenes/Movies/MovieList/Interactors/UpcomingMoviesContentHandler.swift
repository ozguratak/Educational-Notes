//
//  UpcomingMoviesContentHandler.swift
//  UpcomingMovies
//
//  Created by Alonso on 6/13/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
import UpcomingMoviesDomain

struct UpcomingMoviesInteractor: MoviesInteractorProtocol {

    let movieUseCase: MovieUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.movieUseCase = movieUseCase
    }

    var displayTitle: String {
        return "Upcoming Movies"
    }

    func getMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        movieUseCase.getUpcomingMovies(page: page, completion: completion)
    }

}
