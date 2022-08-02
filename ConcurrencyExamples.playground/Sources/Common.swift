import Foundation

public func example(_ name: String, execute action: () -> ()) {
  print(String.border(), name, separator: String.breakSpace)

  action()

  print(String.border(), String.breakSpace)
}
