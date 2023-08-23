//
//  MovieViewModelTests.swift
//  MVVMSampleTests
//
//  Created by Khan on 23/08/2023.
//
import XCTest
@testable import MVVMSample
import Combine

final class MovieViewModelTests: XCTestCase {

    
    var viewModel: MovieViewModel!
    var cancellable: AnyCancellable!

    override func setUp() {
            super.setUp()
            // Create an instance of MovieViewModel with mock dependencies
            let mockMovieUseCase = MovieUseCase()
            viewModel = MovieViewModel(movieUsecasetype: mockMovieUseCase)
        }
    override func tearDown() {
            viewModel = nil
            super.tearDown()
        }
    func testloadData() {
           Task {
//               let movieName = "Avengers"
//               let mockMovieUseCase = MovieUseCase()
//               viewModel = MovieViewModel(movieUsecasetype: mockMovieUseCase)
//               try await viewModel.fetchData(name:movieName)
//               viewModel.observeMyData()
//               XCTAssertNotNil(viewModel.movies)
           }
       }
    func testFetchMovieid() async throws{
            // Set up viewModel.movies with a mock MoviesList
//            viewModel.movies = // Set up a mock MoviesList
        let movieName = "Avengers" // Provide a movie name
        
        // Use expectation to wait for the asynchronous method to complete
        let expectation = expectation(description: "Movie data fetched")
        
        do {
            try await viewModel.fetchData(name: movieName)
            viewModel.selectedIndex =  1
            let selectedMovie = viewModel.fetchMovieid()
            // Perform assertions on selectedMovie
        XCTAssertNotNil(selectedMovie)
            // For example:
            // XCTAssertEqual(viewModel.movies?.items.count, expectedItemCount)
            
            expectation.fulfill()
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
        
        await waitForExpectations(timeout: 5, handler: nil)
           
            // For example:
            // XCTAssertEqual(selectedMovie?.title, "Expected Movie Title")
        }
    
   
    
    func testFetchData() async throws {
          let movieName = "Avengers" // Provide a movie name
          
          // Use expectation to wait for the asynchronous method to complete
          let expectation = expectation(description: "Movie data fetched")
          
          do {
              try await viewModel.fetchData(name: movieName)
              // Perform assertions on viewModel.movies
              XCTAssertNotNil(viewModel.movies)
              XCTAssertTrue((viewModel.movies?.items.count)! > 1)
              XCTAssertNotNil(viewModel.movies?.items.first?.title)
              // For example:
              // XCTAssertEqual(viewModel.movies?.items.count, expectedItemCount)
              
              expectation.fulfill()
          } catch {
              XCTFail("Unexpected error: \(error)")
          }
          
        await waitForExpectations(timeout: 5, handler: nil)
      }
//    func testDeinit() {
//            // Initialize the cancellable and observeMyData to simulate their usage
//            cancellable = viewModel.dataPublisher
//                .sink { _ in }
//            viewModel.observeMyData()
//
//            // Ensure the cancellable is added
//            XCTAssertEqual(viewModel.cancellables.count, 1)
//
//            // Simulate the deinit
//            viewModel = nil
//
//            // Verify that the cancellable is canceled{}
//        XCTAssertNil(viewModel.cancellables)
//        }
    func testCancellablesCleanup() {
           // Simulate the addition of a cancellable
           viewModel.dataPublisher
               .sink { _ in }
               .store(in: &viewModel.cancellables)
           viewModel.dataPublisher
               .sink { _ in }
               .store(in: &viewModel.cancellables)
           viewModel.dataPublisher
               .sink { _ in }
               .store(in: &viewModel.cancellables)

           // Ensure the cancellables are added
           XCTAssertEqual(viewModel.cancellables.count, 3)

           // Simulate the deinit
           viewModel = nil
        XCTAssertNil(cancellable)

           // Verify that all cancellables are canceled
//           XCTAssertTrue(viewModel.cancellables.allSatisfy { $0.isCancelled })
       }
   



    func testDownloadImage() async throws {
        self.testloadData()
        try await self.setUp()
//        let movie = viewModel.movies?.items.first // Provide a mock Movie
        let movieName = "Avengers"
        try await viewModel.fetchData(name:movieName)
        XCTAssertNotNil(viewModel.movies?.items.first)
//            do {
//
//                let image: UIImage = try await viewModel.downloadImage(movie: (viewModel.movies?.items.first)!)
//                // Perform assertions on the downloaded image
//
//                // For example:
//                 XCTAssertNotNil(image)
//            } catch {
//                XCTFail("Unexpected error: \(error)")
//            }
        }

}
