import Foundation
import _Concurrency

public func example(_ name: String, execute action: () -> ()) {
  print(String.border(), name, separator: String.breakSpace)

  action()

  print(String.border(), String.breakSpace)
}


public func asyncExample(_ name: String, execute action: @escaping () async -> ()) {
  print(String.border(), name, separator: String.breakSpace)

  Task {
    await action()
  }

  print(String.border(), String.breakSpace)
}
