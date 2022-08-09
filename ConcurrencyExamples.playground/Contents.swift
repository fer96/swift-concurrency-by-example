import Foundation
import _Concurrency

// MARK: - Execute ASYNC/AWAIT functions
asyncExample("Call async functions") {
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

  await processWeather()
}

// MARK: - Execute throwing async functions
asyncExample("Async throws | try await") {
  func fetchFavorites() async throws -> [Int] {
    let url = URL(string: "https://hws.dev/user-favorites.json")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode([Int].self, from: data)
  }

  if let favorites = try? await fetchFavorites() {
    print("Fetched \(favorites.count) favorites.")
  } else {
    print("Failed to fetch favorites.")
  }
}

// MARK: - Execute async let
asyncExample("Handle async let properties") {
  struct User: Decodable {
    let age: Int
    let name: String
  }

  struct Message: Decodable {
    let from: String
    let message: String
  }

  func loadData() async {
    async let (userData, _) = URLSession.shared.data(from:URL(string: "https://hws.dev/user-24601.json")!)
    async let (messageData, _) = URLSession.shared.data(from:URL(string: "https://hws.dev/user-messages.json")!)

    do {
      let decoder = JSONDecoder()
      let user = try await decoder.decode(User.self, from: userData)
      let messages = try await decoder.decode([Message].self, from: messageData)

      print("User \(user.name) has \(messages.count) message(s).")
    } catch {
      print("Sorry, there was a network problem.")
    }
  }

  await loadData()
}
