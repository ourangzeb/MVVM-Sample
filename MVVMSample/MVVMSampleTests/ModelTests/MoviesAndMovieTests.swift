import XCTest
@testable import MVVMSample // Make sure to import your app module

class MoviesAndMovieTests: XCTestCase {

    // Helper function to load JSON data from a file
    private func loadJSONData(from fileName: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json"),
              let jsonData = try? Data(contentsOf: url) else {
            return nil
        }
        return jsonData
    }

    // Test MoviesList Decoding
    func testMoviesListDecoding() throws {
        guard let jsonData = loadJSONData(from: "MoviesListTestData") else {
            XCTFail("Failed to load test data")
            return
        }
        
        let decoder = JSONDecoder()
        let moviesList = try decoder.decode(MoviesList.self, from: jsonData)
        XCTAssertEqual(moviesList.items.count,20)
//        XCTAssertEqual(moviesList.page, 1)
//                XCTAssertEqual(moviesList.results.count, 15) // Number of movies in the provided JSON
//                XCTAssertEqual(moviesList.totalPages, 42)
//                XCTAssertEqual(moviesList.totalResults, 826)
    
       
    }

    // Test Movie Decoding
    func testMovieDecoding() throws {
        guard let jsonData = loadJSONData(from: "MoviesListTestData") else {
            XCTFail("Failed to load test data")
            return
        }
        
        let decoder = JSONDecoder()
        let moviesList = try decoder.decode(MoviesList.self, from: jsonData)
        
//                XCTAssertEqual(moviesList.items.first?.id, 604605)
        XCTAssertEqual(moviesList.items.first?.title, "Hello World")
                XCTAssertEqual(moviesList.items.first?.overview, "A shy high schooler in Kyoto meets a man claiming to be his future self, who tells him he’s hacked into the past to save their first love.")
                XCTAssertEqual(moviesList.items.first?.poster, "/vmizP4G4EWsxNf6PLOvGNaFJ89Y.jpg")
                XCTAssertEqual(moviesList.items.first?.voteAverage, 7.318)
                XCTAssertEqual(moviesList.items.first?.releaseDate, "2019-09-20")
                XCTAssertEqual(moviesList.items.first?.genreIds, [.animation, .romance, .scienceFiction])
            
        
    }
}
