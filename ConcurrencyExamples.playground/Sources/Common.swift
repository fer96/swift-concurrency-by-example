import Foundation

public func example(_ name: String, execute: () -> ()) {
  print(String.border(), name, separator: String.breakSpace)
  execute()
  print(String.border(), String.breakSpace)
}
