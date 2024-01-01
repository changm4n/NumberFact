import CombineRIBs

protocol HomeRouting: ViewableRouting {
  func attachDetail(count: Int)
  func detachDetail()
}

protocol HomePresentable: Presentable {
  var listener: HomePresentableListener? { get set }
  func updateCount(count: Int)
}

protocol HomeInteractorDependency {
  
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {
  
  weak var router: HomeRouting?
  
  private let dependency: HomeInteractorDependency
  
  private var count: Int = 0
  init(presenter: HomePresentable, dependency: HomeInteractorDependency) {
    self.dependency = dependency
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    self.presenter.updateCount(count: self.count)
  }
  
  // MARK: - HomePresentableListener
  
  func presentableRemoved() {
    
  }
  
  func incrButtonTapped() {
    self.count += 1
    self.presenter.updateCount(count: self.count)
  }
  
  func decrButtonTapped() {
    guard self.count > 0 else { return }
    self.count -= 1
    self.presenter.updateCount(count: self.count)
  }
  
  func showFactButtonTapped() {
    self.router?.attachDetail(count: self.count)
  }
  
  // MARK: - DetailListener
  
  func detailDidCancel() {
    self.router?.detachDetail()
  }
}
