import Foundation
import CombineRIBs

public protocol DetailBuildable: Buildable {
  func build(withListener listener: DetailListener, count: Int) -> ViewableRouting
}

public protocol DetailListener: AnyObject {
  func detailDidCancel()
}
