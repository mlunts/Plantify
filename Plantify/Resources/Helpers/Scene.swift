// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum HomePage: StoryboardType {
    internal static let storyboardName = "HomePage"

    internal static let initialScene = InitialSceneType<UIKit.UINavigationController>(storyboard: HomePage.self)

    internal static let homePageTableViewController = SceneType<Plantify.HomePageTableViewController>(storyboard: HomePage.self, identifier: "HomePageTableViewController")

    internal static let homePageViewController = SceneType<Plantify.HomePageViewController>(storyboard: HomePage.self, identifier: "HomePageViewController")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum Orders: StoryboardType {
    internal static let storyboardName = "Orders"

    internal static let ordersCollectionViewController = SceneType<Plantify.OrdersCollectionViewController>(storyboard: Orders.self, identifier: "OrdersCollectionViewController")

    internal static let ordersViewController = SceneType<Plantify.OrdersViewController>(storyboard: Orders.self, identifier: "OrdersViewController")
  }
  internal enum PlantDetails: StoryboardType {
    internal static let storyboardName = "PlantDetails"

    internal static let plantDetailsTableViewController = SceneType<Plantify.PlantDetailsTableViewController>(storyboard: PlantDetails.self, identifier: "PlantDetailsTableViewController")

    internal static let plantDetailsViewController = SceneType<Plantify.PlantDetailsViewController>(storyboard: PlantDetails.self, identifier: "PlantDetailsViewController")
  }
  internal enum Plants: StoryboardType {
    internal static let storyboardName = "Plants"

    internal static let plantsTableViewController = SceneType<Plantify.PlantsTableViewController>(storyboard: Plants.self, identifier: "PlantsTableViewController")

    internal static let plantsViewController = SceneType<Plantify.PlantsViewController>(storyboard: Plants.self, identifier: "PlantsViewController")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

private final class BundleToken {}
