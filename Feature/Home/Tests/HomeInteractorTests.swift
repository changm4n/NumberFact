import Foundation
import SharedPackage
import CombineRIBs
import XCTest
import Home
import DetailTestSupport
@testable import HomeImpl

final class HomeInteractorTests: XCTestCase {
  
  private var sut: HomeInteractor!
  private var dependency: HomeInteractorDependency!
  private var presenter: HomePresentableMock!
  private var router: HomeRoutingMock!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.dependency = HomeDependencyMock()
    self.presenter = HomePresentableMock()
    self.sut = HomeInteractor(presenter: self.presenter, dependency: self.dependency)
    self.router = HomeRoutingMock(interactable: self.sut, viewControllable: ViewControllableMock())
    self.sut.router = self.router
  }
  
  func testActivated() throws {
    // given
    
    // when
    self.sut.didBecomeActive()
    
    // then
    XCTAssertEqual(self.presenter.updateCountCallCount, 1)
  }
  
  func testIncrButtonTapped() throws {
    // given
    
    // when
    self.sut.incrButtonTapped()
    
    // then
    XCTAssertEqual(self.presenter.updateCountValue, 1)
    XCTAssertEqual(self.presenter.updateCountCallCount, 1)
  }
  
  func testDecrButtonTappedWhenNonZero() throws {
    // given
    self.sut.incrButtonTapped()
    self.sut.incrButtonTapped()
    self.sut.incrButtonTapped()
    
    // when count == 3
    self.sut.decrButtonTapped()
    
    // then
    XCTAssertEqual(self.presenter.updateCountValue, 2)
    XCTAssertEqual(self.presenter.updateCountCallCount, 4)
  }
  
  func testDecrButtonTappedWhenZero() throws {
    // given
    
    // when
    self.sut.decrButtonTapped()
    
    // then
    XCTAssertEqual(self.presenter.updateCountValue, 0)
    XCTAssertEqual(self.presenter.updateCountCallCount, 0)
  }
  
  func testShowFactButtonTapped() throws {
    // given
    
    // when
    self.sut.showFactButtonTapped()
    
    // then
    XCTAssertEqual(self.router.attachDetailCallCount, 1)
  }
  
  func testDetailDidCancel() {
    // given
    
    // when
    self.sut.detailDidCancel()
    
    //then
    XCTAssertEqual(self.router.detachDetailCallCount, 1)
  }
  
}
