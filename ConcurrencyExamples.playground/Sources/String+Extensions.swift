import Foundation

public extension String {
  static let breakSpace = "\n"

  static func border(_ str: Self = "=", repeat times: Int = 9) -> Self {
    return String(repeating: str, count: times)
  }
}
