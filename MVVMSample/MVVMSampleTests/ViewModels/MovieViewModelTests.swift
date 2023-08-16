//import XCTest
//@testable import MVVMSample // Make sure to import your app module
//
//class MovieViewModelTests: XCTestCase {
//
//    var viewModel: MovieViewModel!
//
//    override func setUpWithError() throws {
//        viewModel = MovieViewModel(movieUsecasetype: MockMovieUseCase())
//    }
//
//    override func tearDownWithError() throws {
//        viewModel = nil
//    }
//
//    func testFetchData() async throws {
//        let expectation = expectation(description: "FetchDataExpectation")
//        let movieName = "Avengers"
//        
//        try await viewModel.fetchData(name: movieName)
//        
//        XCTAssertNotNil(viewModel.movies)
//        XCTAssertEqual(viewModel.movies?.items.count, 3) // Assuming you expect 3 movies
//        
//        expectation.fulfill()
//        wait(for: [expectation], timeout: 5)
//    }
//
//    func testFetchMovieId() {
//        viewModel.movies = Movies(items: [Movie(id: 1, title: "Movie 1"), Movie(id: 2, title: "Movie 2")])
//        viewModel.selectedIndex = 1
//        
//        let movie = viewModel.fetchMovieid()
//        XCTAssertNotNil(movie)
//        XCTAssertEqual(movie?.id, 2)
//        XCTAssertEqual(movie?.title, "Movie 2")
//    }
//
//    // You can add more tests for other methods like downloadImage and observeMyData here
//}
//
//// MockMovieUseCase to simulate the behavior of your MovieUseCase
//class MockMovieUseCase: MovieUsecaseType {
//    func fetchData(with name: String) async throws -> Movies {
//        // Simulate fetching data here
//        let movies = Movies(items: [Movie(id: 1, title: "Movie 1"), Movie(id: 2, title: "Movie 2"), Movie(id: 3, title: "Movie 3")])
//        return movies
//    }
//    
//    func loadImage(from movie: Movie) async throws -> UIImage {
//        // Simulate loading image here
//        return UIImage()
//    }
//}
//
