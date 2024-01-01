import CombineRIBs

public protocol HomeBuildable: Buildable {
  func build() -> LaunchRouting
}

