import Foundation

func formatTemperature(_ temperature: Int16) -> String {
    let measurementSystem = Locale.current.measurementSystem
    let temperatureCelsius = temperature
    let temperatureFahrenheit = Int(Double(temperature) * 1.8 + 32)

    switch measurementSystem {
    case .metric:
        return "\(temperatureCelsius)°C / \(temperatureFahrenheit)°F"
    case .us:
        return "\(temperatureFahrenheit)°F / \(temperatureCelsius)°C"
    default:
        return "\(temperatureCelsius)°C / \(temperatureFahrenheit)°F"
    }

}
