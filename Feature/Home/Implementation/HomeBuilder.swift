import CombineRIBs
import Home
import Detail

public protocol HomeDependency: Dependency {
  var detailBuildable: DetailBuildable { get }
}

final class HomeComponent: Component<HomeDependency>, HomeInteractorDependency, HomeRouterDependency {
  var detailBuildable: DetailBuildable { self.dependency.detailBuildable }
}

// MARK: - Builder

public final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {
  
  public override init(dependency: HomeDependency) {
    super.init(dependency: dependency)
  }
  
  public func build() -> LaunchRouting {
    let component = HomeComponent(dependency: self.dependency)
    let viewController = HomeViewController()
    let interactor = HomeInteractor(presenter: viewController, dependency: component)
    return HomeRouter(interactor: interactor, viewController: viewController, dependency: component)
  }
}
