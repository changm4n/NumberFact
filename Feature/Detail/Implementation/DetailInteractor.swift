import CombineRIBs
import Detail
import Usecase

protocol DetailRouting: ViewableRouting {
  
}

protocol DetailPresentable: Presentable {
  var listener: DetailPresentableListener? { get set }
  @MainActor func updateLabel(text: String)
}

protocol DetailInteractorDependency {
  var count: Int { get }
  var fetchFactUsecase: FetchFactusecase { get }
}

final class DetailInteractor: PresentableInteractor<DetailPresentable>, DetailInteractable, DetailPresentableListener {
  
  weak var router: DetailRouting?
  weak var listener: DetailListener?
  
  private let dependency: DetailInteractorDependency
  
  init(presenter: DetailPresentable, dependency: DetailInteractorDependency) {
    self.dependency = dependency
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  // MARK: - DetailPresentableListener
  
  func presentableRemoved() {
    self.listener?.detailDidCancel()
  }
  
  func viewWillAppear() async {
    do {
      let fact = try await self.dependency.fetchFactUsecase.fetch(count: self.dependency.count)
      await self.presenter.updateLabel(text: fact ?? "nil")
    } catch {
      await self.presenter.updateLabel(text: error.localizedDescription)
    }
  }
}
