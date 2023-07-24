
func calculateGrindSize(size: Int16) -> String {
    switch size {
    case 1:
        return "coarse"
    case 2:
        return "medium-coarse"
    case 3:
        return "medium"
    case 4:
        return "medium-fine"
    case 5:
        return "fine"
    default:
        return "invalid"
    }
}

func calculateStrength(ratio: String) -> String {
    if let ratio = parseRatio(ratio) {
        if ratio <= 1.0 / 18.0 {
            return "Weak"
        } else if ratio < 1.0 / 15.0 {
            return "Medium"
        } else {
            return "Strong"
        }
    } else {
        print("Invalid ratio string")
        return "Error"
    }
}
