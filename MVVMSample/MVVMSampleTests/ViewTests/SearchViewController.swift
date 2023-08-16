////
////  SearchViewController.swift
////  MVVMSampleTests
////
////  Created by Khan on 19/03/2023.
////
//
//import XCTest
//@testable import MVVMSample
//
//class MainViewControllerTests: XCTestCase {
//    
//    var mainViewController: MainViewController!
//
//    override func setUp() {
//        super.setUp()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
//        mainViewController.loadViewIfNeeded()
//    }
//    
//    override func tearDown() {
//        mainViewController = nil
//        super.tearDown()
//    }
//    
//    func testTableViewIsNotNil() {
//        XCTAssertNotNil(mainViewController.tableView)
//    }
//    
//    func testSearchBarIsNotNil() {
//        XCTAssertNotNil(mainViewController.searchbar)
//    }
//    
//    func testViewControllerConformsToTableViewDelegateProtocol() {
//        XCTAssertTrue(mainViewController.conforms(to: UITableViewDelegate.self))
//    }
//    
//    func testViewControllerConformsToTableViewDataSourceProtocol() {
//        XCTAssertTrue(mainViewController.conforms(to: UITableViewDataSource.self))
//    }
//    
//    func testLoadDataMethod() {
//        mainViewController.loadData(name: "Avengers")
//        XCTAssertNotNil(mainViewController.viewModel.movies)
//    }
//    
////    func testFetchDataMethod() {
////        let expectation = XCTestExpectation(description: "Fetch Data")
////        mainViewController.viewModel.fetchData(name: "Avengers")
////            .sink { completion in
////                switch completion {
////                case .failure(let error):
////                    XCTFail(error.localizedDescription)
////                case .finished:
////                    expectation.fulfill()
////                }
////            } receiveValue: { _ in }
////            .store(in: &mainViewController.viewModel.cancellables)
////        wait(for: [expectation], timeout: 10.0)
////    }
////    
////    func testObserveMyDataMethod() {
////        let expectation = XCTestExpectation(description: "Observe Data")
////        mainViewController.viewModel.fetchData(name: "Avengers")
////            .flatMap { _ in self.mainViewController.viewModel.observeMyData() }
////            .sink { completion in
////                switch completion {
////                case .failure(let error):
////                    XCTFail(error.localizedDescription)
////                case .finished:
////                    expectation.fulfill()
////                }
////            } receiveValue: { _ in }
////            .store(in: &mainViewController.viewModel.cancellables)
////        wait(for: [expectation], timeout: 10.0)
////    }
//    
//    func testTableViewUpdateWithData() {
//        mainViewController.loadData(name: "Avengers")
//        let expectedRowCount = mainViewController.viewModel.movies?.items.count ?? 0
//        let actualRowCount = mainViewController.tableView.numberOfRows(inSection: 0)
//        XCTAssertEqual(expectedRowCount, actualRowCount)
//    }
//    
//    func testDidSelectRowAt() {
//        let indexPath = IndexPath(row: 0, section: 0)
//        mainViewController.tableView.delegate?.tableView?(mainViewController.tableView, didSelectRowAt: indexPath)
//        XCTAssertEqual(mainViewController.viewModel.selectedIndex, indexPath.row + 1)
//    }
//    
//    func testPrepareForSegue() {
////        let detailMovieViewController = DetailMovieViewController()
////        let segue = UIStoryboardSegue(identifier: "SegueIdentifier", source: mainViewController, destination: detailMovieViewController)
////        mainViewController.viewModel.movies = Movies(results: [Movies()])
////        mainViewController.viewModel.selectedIndex = 1
////        mainViewController.prepare(for: segue, sender: nil)
////        XCTAssertNotNil(detailMovieViewController.viewModel.movie)
//    }
//
//}
