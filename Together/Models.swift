//
//  Models.swift
//  Together
//
//  Created by Nathan Glass on 12/18/21.
//
import DateHelper
import Foundation

struct MonthYear: Hashable {
    var month: Int
    var year: Int
}

struct MonthDay: Hashable {
    var month: Int
    var day: Int
}

struct MonthSection: Identifiable {
    var id = UUID()
    var monthAbbreviation: String
//    var posts: [Post]
    var days: [DaySection]
}

struct DaySection: Identifiable {
    var id = UUID()
    var dayAbbreviation: String
    var posts: [Post]
}

extension MonthSection {
    static func create(n: Int) -> [MonthSection] {
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
        let calendar = Calendar(identifier: .gregorian)
        let monthYearCache: [MonthYear: [Post]] = Dictionary(grouping: Post.createModels(n: n)) { post -> MonthYear in
            let cal = calendar.dateComponents([.year, .month], from: post.date)
            return MonthYear(month: cal.month!, year: cal.year!)
        }
        return monthYearCache.map { my, posts in
            (my, posts)
        }.sorted(by: { pair1, pair2 in
            if pair1.0.year == pair2.0.year {
                return pair1.0.month < pair2.0.month
            } else {
                return pair1.0.year < pair2.0.year
            }
        }).compactMap { monthYear, posts in
            guard monthYear.month < 13 else { return nil }
            let daySections: [DaySection] = Dictionary(grouping: posts, by: { post -> MonthDay in
                let cal = calendar.dateComponents([.day, .month], from: post.date)
                return MonthDay(month: cal.month!, day: cal.day!)
            }).sorted { pair1, pair2 in
                if pair1.0.month == pair2.0.month {
                    return pair1.0.day < pair2.0.day
                } else {
                    return pair1.0.month < pair2.0.month
                }
            }.compactMap { monthDay, posts in
                return DaySection(dayAbbreviation: String(monthDay.day), posts: posts.sorted { $0.date < $1.date })
            }
            
            return MonthSection(monthAbbreviation: months[monthYear.month - 1], days: daySections)
        }
    }
}

struct Post: Identifiable, Hashable {
    var id = UUID()
    var date: Date
}

extension Post {
    static func createModels(n: Int = 10) -> [Post] {
        var d = Date()
        return (0..<n).map { _ -> Post in
            let date = d.adjust(.day, offset: Int.random(in: -35 ..< 1))
            d = date
            return Post(date: date)
        }
    }
}

extension Date {
    var day: Int {
        let calendarDate = Calendar.current.dateComponents([.day], from: self)
        return calendarDate.day!
    }
}
