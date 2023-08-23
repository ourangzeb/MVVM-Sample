import XCTest
@testable import MVVMSample

class MovieUseCaseTests: XCTestCase {
    
    var movieUseCase: MovieUseCase!
    var mockNetworkService: NetworkService!
    var mockImageDownloadService: ImagedownloadService!
    
    override func setUpWithError() throws {
        mockNetworkService = NetworkService()
        mockImageDownloadService = ImagedownloadService()
        movieUseCase = MovieUseCase(networkService: mockNetworkService, imageDownloadService: mockImageDownloadService)
    }
    
    override func tearDownWithError() throws {
        movieUseCase = nil
        mockNetworkService = nil
        mockImageDownloadService = nil
    }
    func testFetchData() async throws {
        // Implement test for fetchData(with:) here...
//        let service = NetworkService().load(T##resource: Resource<Decodable>##Resource<Decodable>)
        let moviesList = try await mockNetworkService.load(Resource<MoviesList>.movies(query: "tom"))
        XCTAssertNotNil(moviesList)
         
    }
    
    func testLoadImage() async throws {
        let moviesList = try await mockNetworkService.load(Resource<MoviesList>.movies(query: "tom"))
        let imagedownload =  try await mockImageDownloadService.downloadImage(from: ImageSize.original.url.appendingPathComponent(moviesList.items.first?.poster! ?? ""))
        XCTAssertNotNil(imagedownload)
        // Implement test for loadImage(from:) here...
    }
    
    func testFetchMovieDetails() async throws {
        let value =  try await NetworkService().load(Resource<Movie>.details(movieId: 178172))
        XCTAssertNotNil(value)
        // Implement test for fetchMovieDetails(with:) here...
    }
    
    // Add more test cases as needed...
}
