import Home
import HomeImpl
import Detail
import DetailImpl
import Usecase
import UsecaseImpl
import HTTPNetwork
import HTTPNetworkImpl

final class AppComponent: HomeDependency, DetailDependency {
  // Platform
  let httpNetwork: HTTPNetwork
  
  // Domain
  let fetchFactUsecase: FetchFactusecase
  
  // Feature
  lazy var homeBuildable: HomeBuildable = HomeBuilder(dependency: self)
  lazy var detailBuildable: DetailBuildable = DetailBuilder(dependency: self)
  
  init() {
    let httpNetwork = HTTPNetworkImp(session: .shared)
    self.httpNetwork = httpNetwork
    self.fetchFactUsecase = FetchFactUsecaseImpl(network: httpNetwork)
  }
}
