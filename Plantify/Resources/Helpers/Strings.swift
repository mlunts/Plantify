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
  /// 
  internal static let emptyString = L10n.tr("Localizable", "emptyString")
  /// No title
  internal static let noTitleText = L10n.tr("Localizable", "noTitleText")
  /// Hi, \nWhat plant do you see?
  internal static let pageHeader = L10n.tr("Localizable", "pageHeader")
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
