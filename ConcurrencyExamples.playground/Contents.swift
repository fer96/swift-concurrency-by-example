import Foundation
import _Concurrency

Task {
  func fetchWeatherHistory() async -> [Double] {
    return (1...100_000).map { _ in Double.random(in: -10...30) }
  }

  func calculateAverageTemperature(for records: [Double]) async -> Double {
    let total = records.reduce(0, +)
    let average = total / Double(records.count)
    return average
  }

  func upload(result: Double) async -> String {
    return "OK"
  }

  func processWeather() async {
    let records = await fetchWeatherHistory()
    // anything could happen here
    let average = await calculateAverageTemperature(for: records)
    // or here
    let response = await upload(result: average)
    // or here
    print("Server response: \(response)")
  }

  print(String.border(), "Process weather", separator: String.breakSpace)
  await processWeather()
  print(String.border(), String.breakSpace)
}
