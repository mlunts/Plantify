// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// OK
  internal static let alertTitleOK = L10n.tr("Localizable", "alertTitleOK")
  /// Retry
  internal static let alertTitleRetry = L10n.tr("Localizable", "alertTitleRetry")
  /// Cancel
  internal static let cancelText = L10n.tr("Localizable", "cancelText")
  /// Choose From Library
  internal static let chooseFromLibrary = L10n.tr("Localizable", "chooseFromLibrary")
  /// 
  internal static let emptyString = L10n.tr("Localizable", "emptyString")
  /// Cannot identify the flower. Try again with another image.
  internal static let errorNoClassifiedFlower = L10n.tr("Localizable", "errorNoClassifiedFlower")
  /// No server response received
  internal static let errorNoServerAnswer = L10n.tr("Localizable", "errorNoServerAnswer")
  /// Oops!
  internal static let errorOops = L10n.tr("Localizable", "errorOops")
  /// Explore flowers
  internal static let homePageExploreHeader = L10n.tr("Localizable", "homePageExploreHeader")
  /// What flower do you see?
  internal static let homePageHeader = L10n.tr("Localizable", "homePageHeader")
  /// You have no recent identified flowers.
  internal static let homePageNoRecentFlowers = L10n.tr("Localizable", "homePageNoRecentFlowers")
  /// Recent flowers
  internal static let homePageRecentFlowers = L10n.tr("Localizable", "homePageRecentFlowers")
  /// View All
  internal static let homePageViewAll = L10n.tr("Localizable", "homePageViewAll")
  /// No title
  internal static let noTitleText = L10n.tr("Localizable", "noTitleText")
  /// Orders
  internal static let ordersPageHeader = L10n.tr("Localizable", "ordersPageHeader")
  /// Not poisoned
  internal static let plantInfoNotPoisoned = L10n.tr("Localizable", "plantInfoNotPoisoned")
  /// Poisoned
  internal static let plantInfoPoisoned = L10n.tr("Localizable", "plantInfoPoisoned")
  /// Botanical name:
  internal static let plantInfoTaxonomyHeaderBotanicalName = L10n.tr("Localizable", "plantInfoTaxonomyHeaderBotanicalName")
  /// Family:
  internal static let plantInfoTaxonomyHeaderFamily = L10n.tr("Localizable", "plantInfoTaxonomyHeaderFamily")
  /// Order:
  internal static let plantInfoTaxonomyHeaderOrder = L10n.tr("Localizable", "plantInfoTaxonomyHeaderOrder")
  /// Tribe:
  internal static let plantInfoTaxonomyHeaderTribe = L10n.tr("Localizable", "plantInfoTaxonomyHeaderTribe")
  /// General uses:
  internal static let plantInfoTaxonomyHeaderUses = L10n.tr("Localizable", "plantInfoTaxonomyHeaderUses")
  /// No flowers have been found
  internal static let plantsPageNotFound = L10n.tr("Localizable", "plantsPageNotFound")
  /// Take Photo
  internal static let takePhoto = L10n.tr("Localizable", "takePhoto")
  /// Please,wait...
  internal static let waitingAlert = L10n.tr("Localizable", "waitingAlert")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
