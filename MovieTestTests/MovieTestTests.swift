//
//  MovieTestTests.swift
//  MovieTestTests
//
//  Created by Moez bachagha on 23/8/2023.
//

import XCTest
@testable import MovieTest

final class MovieTestTests: XCTestCase {
    
    let mockAPI = MockMovieAPI()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testGettingCitiesWithMockEmptyResult() {
        let expectation = expectation(description: "testing empty state with mock api")
        
       
        mockAPI.loadState = .empty
        
        let viewModel = MoviesViewModel(apiService: mockAPI)
        viewModel.getMovies { movies, error in
            
            XCTAssertTrue(movies?.isEmpty == true, "Expected movies to be empty, but received some values")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                XCTFail("Expectation failed \(error)")
            }
        }
    }
    
    func testGettingMoviesWithErrorResult() {
        let expectation = expectation(description: "testing error state with mock api")
        
        
        mockAPI.loadState = .error
        
        let viewModel = MoviesViewModel(apiService: mockAPI)
        viewModel.getMovies { movies, error in
            XCTAssertTrue(movies == nil, "Expected to get no movies and error, but received movies")
            XCTAssertNotNil(error, "Expected to get an error, but received no error")
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                XCTFail("Expectation failed \(error)")
            }
        }
    }
    
    func testGettingMoviesWithSuccess() {
        let expectation = expectation(description: "testing success state with mock api")
        
        mockAPI.loadState = .loaded
        
        let viewModel = MoviesViewModel(apiService: mockAPI)
        viewModel.getMovies { movies, error in
            XCTAssert(movies?.isEmpty == false, "Expected to get Movies")
            XCTAssertNil(error, "Expected error to be nil")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                XCTFail("Expectation failed \(error)")
            }
        }
    }
    
    
    
    
    func testGettingMovieDetailsWithErrorResult() {
        let expectation = expectation(description: "testing error state with mock api")
        
        mockAPI.loadState = .error
        
        let viewModel = MoviesViewModel(apiService: mockAPI)
        viewModel.getMovieDetails(movieId: 976573, completion: { movie, error in
            
            XCTAssertTrue(movie == nil, "Expected to get no movie Details and error, but received details")
            XCTAssertNotNil(error, "Expected to get an error, but received no error")
            
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                XCTFail("Expectation failed \(error)")
            }
        }
    }
    
    func testGettingMovieDetailsWithSuccess() {
        let expectation = expectation(description: "testing success state with mock api")
        mockAPI.loadState = .loaded
        
        let viewModel = MoviesViewModel(apiService: mockAPI)
        viewModel.getMovieDetails(movieId: 976573, completion: { movie, error in
            
            XCTAssert(movie?.title?.isEmpty == false, "Expected to get movie  Details")
            XCTAssertNil(error, "Expected error to be nil")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                XCTFail("Expectation failed \(error)")
            }
        }
    }
}
