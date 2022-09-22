public struct ItemsCore {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

import Foundation

struct DateUtils {
    static let formatter = DateFormatter()
    static let oneMinuteInSeconds: Double = 60
    static let oneHourInSeconds: Double = 60 * 60
    static let oneDayInSeconds: Double = 60 * 60 * 24
    static let oneYearInSeconds: Double = 60 * 60 * 24 * 365

    static func getShortDateString(_ stringDate: String) -> String {
        DateUtils.formatter.dateFormat = "yyy-MM-dd'T'HH:mm:ssZ"
        let priorDate = DateUtils.formatter.date(from: stringDate)
        guard let priorDate = priorDate else {
            return "nil"
        }
        return convertDateToShortStr(priorDate)
    }

    static func getShortDateStrFromDate(_ date: Date) -> String {
        convertDateToShortStr(date)
    }

    static func getShortDateStringFromFutureDate(_ stringDate: String) -> String {
        DateUtils.formatter.dateFormat = "yyy-MM-dd'T'HH:mm:ssZ"
        let priorDate = DateUtils.formatter.date(from: stringDate)
        guard let priorDate = priorDate else {
            return "nil"
        }
        return convertFutureDateToShortStr(priorDate)
    }

    private static func convertDateToShortStr(_ date: Date) -> String {
        let now = Date()
        let interval = now.timeIntervalSince(date)

        return convertTimeIntervalToShortStr(interval)
    }

    private static func convertFutureDateToShortStr(_ date: Date) -> String {
        let now = Date()
        let interval = date.timeIntervalSince(now)

        return convertTimeIntervalToShortStr(interval)
    }

    private static func convertTimeIntervalToShortStr(_ interval: Double) -> String {
        let diffInDays: Int = lround(interval / DateUtils.oneDayInSeconds)

        if interval / DateUtils.oneHourInSeconds < 1 {
            return "\(lround(interval / DateUtils.oneMinuteInSeconds))min"
        } else if interval / DateUtils.oneDayInSeconds < 1 {
            return "\(lround(interval / DateUtils.oneHourInSeconds))h"
        } else if diffInDays < 30 {
            return "\(diffInDays)d"
        } else if diffInDays < 365 {
            return "\(diffInDays / 30)m"
        } else {
            return "\(lround(interval / DateUtils.oneYearInSeconds))y"
        }
    }

    static func getDateString(_ stringDate: String, timeStyle: DateFormatter.Style) -> String {
        DateUtils.formatter.dateFormat = "yyy-MM-dd'T'HH:mm:ssZ"
        let priorDate = DateUtils.formatter.date(from: stringDate)
        guard let priorDate = priorDate else {
            return "nil"
        }
        DateUtils.formatter.locale = .current
        DateUtils.formatter.dateStyle = .medium
        DateUtils.formatter.timeStyle = timeStyle
        return DateUtils.formatter.string(from: priorDate)
    }

    static func getString(date: Date) -> String {
        DateUtils.formatter.dateFormat = "yyy-MM-dd'T'HH:mm:ssZ"
        return DateUtils.formatter.string(from: date)
    }

    static func getDate(_ stringDate: String) -> Date {
        DateUtils.formatter.dateFormat = "yyy-MM-dd'T'HH:mm:ssZ"
        let priorDate = DateUtils.formatter.date(from: stringDate)
        guard let priorDateX = priorDate else {
            return Date()
        }
        return priorDateX
    }
}

struct NumUtils {
    static let formatter = NumberFormatter()

    static func shortString(_ num: Int) -> String {
        NumUtils.formatter.maximumFractionDigits = 1

        if abs(num) < 1000 {
            return "\(num)"
        } else if abs(num) < 1_000_000 {
            let value = num / 1000
            let stringNum = NumUtils.formatter.string(from: NSNumber(value: value)) ?? "kk"
            return "\(stringNum) k"
        } else {
            let value = num / 1_000_000
            let stringNum = NumUtils.formatter.string(from: NSNumber(value: value)) ?? "mm"
            return "\(stringNum) m"
        }
    }
}
