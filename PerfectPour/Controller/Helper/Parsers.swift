func parseRatio(_ ratioString: String) -> Double? {
    let components = ratioString.split(separator: ":")
    guard components.count == 2,
          let numerator = Double(components[0]),
          let denominator = Double(components[1]),
          denominator != 0
    else {
        return nil // Invalid ratio string
    }
    return numerator / denominator
}


func formatFloat(_ value: Float) -> String {
    let roundedValue = (value * 10).rounded() / 10 // Round to first decimal point
    
    if roundedValue.truncatingRemainder(dividingBy: 1) == 0 {
        return String(format: "%.0f", roundedValue) // Remove .0 from whole numbers
    } else {
        return String(format: "%.1f", roundedValue) // Format with one decimal point
    }
}
